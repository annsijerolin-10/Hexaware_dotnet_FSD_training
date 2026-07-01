import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { users } from "../data/users";
export function Login(){
    const[username,setUsername]=useState("");
    const[password,setPassword]=useState("");
    const[error,setError]=useState("");
    const navigate=useNavigate();
    function handleLogin(event){
        event.preventDefault();
        if(username.trim()===""){
            setError("Username is required");
            return;
        }
        if(password.trim()===""){
            setError("Password is required");
        }
        const loggedInUser=users.find((user)=>
            user.username===username && user.password=== password);
         if (loggedInUser) {
           
             localStorage.setItem("user", JSON.stringify({
                username: loggedInUser.username,
                isAuthenticated: true
             }));

            navigate("/dashboard");
        } 
        else {
            setError("Invalid username or password");
        }
        

    }

    return(
        <div className="login">
            <h2>Login</h2>
            <form onSubmit={handleLogin}>
                <div>
                    <label>Username</label>
                    <input
                       type="text"
                       value={username}
                       onChange={(e)=>setUsername(e.target.value)}
                    />
                </div>
                <div>
                    <label>Password</label>
                    <input 
                       type="password"
                       value={password}
                       onChange={(e)=>setPassword(e.target.value)}
                    />
                </div>

                <button type="submit">Login</button>
                <p>{error}</p>

            </form>
        </div>
    );
}