import { useNavigate } from "react-router-dom"
export function Home(){
    const navigate=useNavigate();
    return(
        <>
        <div className="home">
            <h1>Welcome to Student Learning Portal.</h1>
            <p>
                Learn React,Web API,and Full Stack Develpment from
                one place.
            </p>
       
        <button onClick={()=>navigate("/courses")}>
            View Courses

        </button>
        <button onClick={()=>navigate("/dashboard")}>
            Go to Dasboard

        </button>
         </div>
        </>
    )
}