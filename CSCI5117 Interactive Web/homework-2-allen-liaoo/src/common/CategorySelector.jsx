import { useContext } from "react"
import { CategoriesContext } from '../routes/Todos'

/* eslint-disable jsx-a11y/anchor-is-valid */
export default function CategorySelector({ category, updateCategory }) {
    const categories = useContext(CategoriesContext)
    return <div className="dropdown is-left is-hoverable">
        <div className="dropdown-trigger">
            <button className="button" aria-haspopup="true" aria-controls="dropdown-menu">
            <span>{ category ?? "No category..."}</span>
            <span className="icon is-small">
                <i className="fas fa-angle-down" aria-hidden="true"></i>
            </span>
            </button>
        </div>
        <div className="dropdown-menu" id="dropdown-menu" role="menu">
            <div className="dropdown-content">
                { categories
                    // .filter((c)=>c!==category)
                    .map((c) => {
                    return <a key={c}
                        className="dropdown-item"
                        onClick={()=>updateCategory(c)}> {c} </a>
                }) }
            </div>
        </div>
    </div>
}