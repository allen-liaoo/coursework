const { app } = require('@azure/functions');
const { ObjectId } = require('mongodb');
const mongoClient = require("mongodb").MongoClient;

function getUserID(request) {
    return request.headers?.get('x-ms-client-principal')
}

async function upsertCategory(userId, category) {
    const client = await mongoClient.connect(process.env.AZURE_MONGO_DB)
    const res = await client.db("liao0144hw2")
        .collection("categories")
        .updateOne({
                user_id: userId,
                category: category
            }, { $set: {
                user_id: userId,
                category: category
            }}, {
                upsert: true
        })
    client.close()

    if (res.acknowledged) return {
        modified: res.modifiedCount > 0
    }
    else return {
        error: true,
    }
}

app.http('getTodos', {
    methods: ['GET'],
    route: 'todos',
    handler: async (request, context) => {
        const userId = getUserID(request)
        if (!userId) return {
            status: 401,
            jsonBody:{
                error: "Not signed in"
            }
        }

        const client = await mongoClient.connect(process.env.AZURE_MONGO_DB)
        const todos = await client.db("liao0144hw2")
            .collection("todos")
            .find({user_id: userId}) // make sure they can only get their own todo items
            .project({user_id: 0}).toArray()
        client.close()
        return {
            status: 200,
            jsonBody: {
                todos
            }
        }
    }
})

app.http('insertTodo', {
    methods: ['PUT'],
    route: 'todo',
    handler: async (request, context) => {
        const userId = getUserID(request)
        if (!userId) return {
            status: 401, 
            jsonBody: {
                error: "Not signed in"
            }
        }

        const body = await request.json()

        const client = await mongoClient.connect(process.env.AZURE_MONGO_DB)
        const res = await client.db("liao0144hw2").collection("todos").insertOne({
                user_id: userId,
                text: body.text,
                done: body.done,
                category: body.category
            })
        client.close()

        upsertCategory(userId, body.category)

        if (res.acknowledged) return {
                status: 200,
                jsonBody: {
                    id: res.insertedId
                }
            }
        else return {
            status: 500,
            jsonBody: {
                error: "Insert todo item failed"
            }
        }
    }
})

app.http('updateTodo', {
    methods: ['POST'],
    route: 'todo',
    handler: async (request, context) => {
        const userId = getUserID(request)
        if (!userId) return {
            status: 401, 
            jsonBody: {
                error: "Not signed in"
            }
        }

        const body = await request.json()
        console.log(body)

        const client = await mongoClient.connect(process.env.AZURE_MONGO_DB)
        const res = await client.db("liao0144hw2").collection("todos").updateOne({
                _id: body._id
            }, { $set: {
                    text: body.text,
                    done: body.done,
                    category: body.category
            }})
        client.close()

        upsertCategory(userId, body.category)

        console.log(res)
        if (res.acknowledged) return {
                status: 200,
                jsonBody: {
                    modified: res.modifiedCount > 0
                }
            }
        else return {
            status: 500,
            jsonBody: {
                error: "Update todo item failed"
            }
        }
    }
})

app.http('deleteTodo', {
    methods: ['DELETE'],
    route: 'todo',
    handler: async (request, context) => {
        const userId = getUserID(request)
        if (!userId) return {
            status: 401, 
            jsonBody: {
                error: "Not signed in"
            }
        }

        const body = await request.json()
        console.log(body)

        const client = await mongoClient.connect(process.env.AZURE_MONGO_DB)
        const res = await client.db("liao0144hw2").collection("todos").deleteOne({
                _id: body._id
            })
        client.close()

        console.log(res)
        if (res.acknowledged) return {
                status: 200,
                jsonBody: {
                    deleted: res.deletedCount > 0
                }
            }
        else return {
            status: 500,
            jsonBody: {
                error: "Delete todo item failed"
            }
        }
    }
})

app.http('getCategories', {
    methods: ['GET'],
    route: 'categories',
    handler: async (request, context) => {
        const userId = getUserID(request)
        if (!userId) return {
            status: 401,
            jsonBody:{
                error: "Not signed in"
            }
        }

        const client = await mongoClient.connect(process.env.AZURE_MONGO_DB)
        const categories = await client.db("liao0144hw2")
            .collection("categories")
            .find({user_id: userId}) // make sure they can only get their own categories
            .project({user_id: 0}).toArray()
        client.close()
        return {
            status: 200,
            jsonBody: {
                categories
            }
        }
    }
})

app.http('upsertCategory', {
    methods: ['POST'],
    route: 'category',
    handler: async (request, context) => {
        const userId = getUserID(request)
        if (!userId) return {
            status: 401,
            jsonBody:{
                error: "Not signed in"
            }
        }

        const body = await request.json()

        const res = await upsertCategory(userId, body.category)
        if (res.error) return {
            status: 500,
            jsonBody: {
                error: "Upsert category failed"
            }
        } 
        else return {
            status: 200,
            jsonBody: {
                modified: res.modified
            }
        }
    }
})