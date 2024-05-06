import React, { useState } from 'react'
import DoneButton from './DoneButton'
import UndoneButton from './UndoneButton'
import TodoItemPopup from "../common/TodoItemPopup"

function TodoItem({item, updateItem, deleteItem}) {
    const [showPopup, setShowPopup] = useState(false) // null or the item obj of the popup item to show
    return <div className="columns is-vcentered">
        <div className="column is-2"></div>
        <div className="column is-1">
            { item.done ?
                <UndoneButton className="button is-success" 
                    onClick={()=>updateItem({...item, done: !item.done})} /> :
                <DoneButton
                    onClick={()=>updateItem({...item, done: !item.done})} />
            }
        </div>
        <div className="column is-4">
            <input className="box" type="text" 
                placeholder="Enter todo info here..."
                defaultValue={item.text ?? ""}
                onChange={(e)=>updateItem({...item, text: e.target.value})}/>
        </div>
        <div className="column is-1">
            { item.category ?
                <span className="tag is-info"> {item.category} </span> :
                <></>
            }
        </div>
        <div className="column is-1">
            <button className="button is-primary" 
                onClick={()=>setShowPopup(true)}>Info</button>
        </div>
        <div className="column is-2"></div>
        {showPopup ?
            <TodoItemPopup item={item}
                updateItem={updateItem}
                deleteItem={deleteItem}
                deletePopup={()=>setShowPopup(false)}></TodoItemPopup> :
            <></>}
    </div>
}

export default React.memo(TodoItem)