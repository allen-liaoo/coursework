import { redirect } from 'react-router-dom';
import logo from '../logo.svg';
import Button from '../common/Button'
// import { useState } from 'react';
// import { useLoaderData } from 'react-router-dom';

export async function loader() {
  const res = await fetch("/.auth/me")
  const resJ = await res.json()
  console.log(resJ)
  const client = resJ.clientPrincipal
  if (client) {
    console.log("logged in! redirecting...")
    return redirect('/todos')
  }
  return null
}

export default function App() {
  return (
      <div>
        <div id="logoText">Welcome to Allen's Homemade Todolist!</div>
        <Button id="loginButton" onClick={()=>{
          window.location.href = '/.auth/login/github'
        }}>Log In</Button>
      </div>
      // <header className="App-header">
      //   <img src={logo} className="App-logo" alt="logo" />
      // </header>
  );
}