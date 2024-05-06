/* eslint-disable jsx-a11y/anchor-is-valid */
import { createContext, useEffect, useState } from 'react'
import TodoList from '../common/TodoList'
import Button from '../common/Button';

export const CategoriesContext = createContext();

// Logical AND of two functions
function andFns(fn1, fn2) {
    return (...args) => fn1.apply(null, args) && fn2.apply(null, args)
}

export default function Todos({todosMode: todosModeProp, category: categoryProp}) {
    const [todosMode, setTodosMode] = useState(todosModeProp)
    const [category, setCategory] = useState(categoryProp)
    const [categories, setCategories] = useState([])

    useEffect(() => {
        (async () => {
            const res = await fetch('/api/categories', {
                method: "GET"
            })
            if (!res.ok) {
                alert("Error fetching categories!") 
                console.log(res)
                return
            }
            const resJ = await res.json()
            setCategories(resJ.categories.map(e=>e.category))
        })()
    }, [])

    async function createCategory(cat) {
        (async () => {
            if (categories.find((e)=>e===cat)) {
                alert("Category already exists!")
                return
            }
            const res = await fetch('/api/category', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({category: cat})
            })
            if (!res.ok) {
                alert("Error creating category!") 
                console.log(res)
                return
            }
            setCategory(cat)
            const cats = [...categories, cat]
            setCategories(cats)
        })()
    }

    // Calculate filter (runs on every rerender)
    let filter = () => true
    let todosFactory = {}
    // toggle showing not-yet-done and done todos
    if (todosMode || todosMode === undefined) { // default
        filter = andFns(filter, (e)=>!e.done)
        todosFactory.done = false
    } else {
        filter = andFns(filter, (e)=>e.done)
        todosFactory.done = true
    }

    // filter by category
    if (category) {
        filter = andFns(filter, (e) => e.category === category)
        todosFactory.category = category
    }

    return <div>
        {/* <section classname='hero is-large is-info'> */}
            {/* <div className='hero-body'> */}
                <nav className="level">
                    <div className="level-left">
                    <h1 className='title is-2'>There is much to do...</h1>
                    </div>
                    <div className="level-right">
                        {/* Category selector */}
                        <div className="dropdown is-hoverable is-right">
                            <div className="dropdown-trigger">
                                <button className="button" aria-haspopup="true" aria-controls="dropdown-menu">
                                <span>{category ?? "Filter by Category"}</span>
                                <span className="icon is-small">
                                    <i className="fas fa-angle-down" aria-hidden="true"></i>
                                </span>
                                </button>
                            </div>
                            <div className="dropdown-menu" id="dropdown-menu" role="menu">
                                <div className="dropdown-content">
                                    <a className="dropdown-item"
                                        onClick={()=>setCategory(null)}> All categories </a>
                                    <hr className="dropdown-divider" />

                                    { categories.filter((c)=>c!==category).map((c) => {
                                        return <a key={c}
                                            className="dropdown-item"
                                            onClick={()=>setCategory(c)}> {c} </a>
                                    }) }

                                    <hr className="dropdown-divider" />
                                    <a className="dropdown-item"
                                        onClick={()=>{
                                            const cat = prompt("Enter the name of a new category:")
                                            createCategory(cat)
                                    }}> Create new category... </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            {/* </div> */}

            {/* Tab selector */}
            {/* <div className='hero-foot'> */}
                <div className="tabs is-centered is-boxed is-fullwidth">
                    <ul>
                        <li className={todosMode ? "is-active" : ""}>
                            <a onClick={()=>{setTodosMode(true)}}>
                                Todos
                            </a>
                        </li>
                        <li className={!todosMode ? "is-active" : ""}>
                            <a onClick={()=>{setTodosMode(false)}}>
                                Done
                            </a>
                        </li>
                    </ul>
                </div>
            {/* </div>
        </section> */}

        <CategoriesContext.Provider value={categories}>
            <TodoList filter={filter} todosFactory={todosFactory}/>
        </CategoriesContext.Provider>

        <Button id="logoutButton" onClick={()=>{
            window.location.href = '/.auth/logout'
        }}>Log Out</Button>
    </div>
}