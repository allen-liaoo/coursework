import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import {
  createBrowserRouter,
  redirect,
  RouterProvider,
} from "react-router-dom";

import AppPage, { loader } from './routes/AppPage';
import Todos from './routes/Todos'
import Page404 from './routes/Page404'

async function authLoader() {
  const res = await fetch("/.auth/me")
  const resJ = await res.json()
  const client = resJ.clientPrincipal
  if (!client) {
    return redirect('/')
  }
  return null
}

// create the router -- paths are configured here
const router = createBrowserRouter([
  {
    path: "/",
    element: <App/>,
    children: [
      {
        index: true,
        element: <AppPage />,
        loader: loader
      }, {
        path: "todos",
        element: <Todos todosMode={true}/>,
        loader: authLoader
      }, {
        path: "done",
        element: <Todos todosMode={false}/>,
        loader: authLoader
      }
    ],
    errorElement: <Page404 />
  }
]);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
        <RouterProvider router={router} />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
