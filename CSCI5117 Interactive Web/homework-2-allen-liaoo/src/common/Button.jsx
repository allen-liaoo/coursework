export default function Button({onClick, children, className, id}) {
    return <button id={id ? id : ""}
                    className={`button is-primary ${className ? className : ''}`}
                    onClick={onClick}>{children}</button>
}