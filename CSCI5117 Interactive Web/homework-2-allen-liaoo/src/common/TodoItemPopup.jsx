import { useState } from "react"
import DoneButton from './DoneButton'
import UndoneButton from './UndoneButton'
import CategorySelector from './CategorySelector'

export default function TodoItemPopup({item, updateItem, deleteItem, deletePopup}) {
    const [text, setNewText] = useState(item.text)
    const [done, setDone] = useState(item.done)
    const [category, setCategory] = useState(item.category)
    return <div className="modal is-active">
        <div className="modal-background"></div>
        <div className="modal-card">
            <header className="modal-card-head">
                <div className="columns is-vcentered">
                    <div className="column is-6 is-offset-1"><p className="modal-card-title">Todo Item</p></div>
                    <div className="column is-6">
                        <CategorySelector category={category} 
                            updateCategory={(c) => {
                                setCategory(c)
                            }} /></div>
                    <div className="column is-1 is-offset-9"><button className="delete" aria-label="close" onClick={deletePopup}></button></div>
                </div>
            </header>

            <section className="modal-card-body">

            <textarea className="textarea"
                    placeholder="Enter todo info here..."
                    rows="10"
                    defaultValue={text}
                    onChange={(e) => setNewText(e.target.value)}></textarea>
            </section>

            <footer className="modal-card-foot">
                <div className="buttons">
                    <button className="button is-success" 
                        onClick={() => {
                            console.log(text)
                            updateItem({_id: item._id, text, done, category})
                            deletePopup()
                        }}>Done</button>
                    {done ?
                        <UndoneButton
                            onClick={()=>setDone(false)}/> :
                        <DoneButton className="button is-warning" 
                            onClick={()=>setDone(true)} />
                    }
                    <button className="button is-danger" 
                        onClick={() => {
                            deleteItem(item._id)
                            deletePopup()
                        }}>Delete</button>
                </div>
            </footer>
        </div>
    </div>
}