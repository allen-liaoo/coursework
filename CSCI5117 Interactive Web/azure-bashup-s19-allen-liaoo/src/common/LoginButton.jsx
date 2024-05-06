import { useEffect, useState } from "react";

export default function LoginButton() {
    const [loggedIn, setLoggedIn] = useState(false)
    const [userName, setUserName] = useState(null)

    function login() {
        window.location.href = '/.auth/login/github'
    }

    async function logout() {
        await fetch('/.auth/logout')
        setUserName(null)
        setLoggedIn(false)
    }

    useEffect(() => {
        async function fetchLogin() {
            const res = await fetch("/.auth/me")
            const resJ = await res.json()
            const client = resJ.clientPrincipal
            if (client){
                setUserName(client.userDetails)
                setLoggedIn(true)
            }
        }
        fetchLogin()
    }, [])

    if (loggedIn) {
        return <button onClick={logout}>
            Logout (You are { userName })
        </button>
    } else 
        return <button onClick={login}>
            Login
        </button>
}