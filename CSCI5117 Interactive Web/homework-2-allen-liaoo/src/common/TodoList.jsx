/* eslint-disable jsx-a11y/anchor-is-valid */
import { useEffect, useState } from "react"
import TodoItem from "./TodoItem"

// filter: a function that takes a todo object and return true/false
// todoFactory: an object serving as the default template for new todo items created
export default function Todos({ filter, todosFactory }) {
    const [todos, setTodos] = useState([])
    useEffect(() => {
        (async () => {
            const res = await fetch('/api/todos', {
                method: "GET"
            })
            if (!res.ok) {
                alert("Error fetching todos!") 
                console.log(res)
                return
            }
            const resJ = await res.json()
            setTodos(resJ.todos)
        })()
    }, [])

    async function insertTodoItem(item) {
        const res = await fetch('/api/todo', {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(item)
        })
        if (!res.ok) {
            alert("Error creating new todo!")
            console.log(res)
            return
        }
        const resJ = await res.json()
        const newTodos = [...todos, {_id: resJ.id, ...item}]
        setTodos(newTodos)
    }

    async function updateTodoItem(item) {
        const res = await fetch('/api/todo', {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(item)
        })
        if (!res.ok) {
            alert(`Error updating todo (id: ${item._id})!`)
            console.log(res)
            return
        }
        console.log(await res.json())
        let newTodos = todos.map((e) => {
                if (e._id === item._id) return item
                else return e
            })
        setTodos(newTodos)
    }

    async function deleteTodoItem(_id) {
        const res = await fetch('/api/todo', {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({_id: _id})
        })
        if (!res.ok) {
            alert(`Error deleting todo (id: ${_id})!`)
            console.log(res)
            return
        }
        console.log(await res.json())
        const newTodos = todos.filter((e) => e._id !== _id)
        setTodos(newTodos)
    }

    let filteredTodos = todos.filter(e=>filter(e))

    return <div>
        { filteredTodos.map((e) =>
            <TodoItem key= {e._id}
                item={e}
                updateItem={updateTodoItem}
                deleteItem={deleteTodoItem}/>) }
        <button className="button is-link" onClick={()=>insertTodoItem(todosFactory)}>Add Todo Item</button>
    </div>
}