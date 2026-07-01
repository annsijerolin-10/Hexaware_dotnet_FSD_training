import { Link,Outlet } from "react-router-dom";
import { useNavigate } from "react-router-dom";

export function Dashboard(){
    const navigate = useNavigate();
    const user = JSON.parse(localStorage.getItem("user"));

    function handleLogout() {
        localStorage.removeItem("user");
        navigate("/login");
    }

    return(
        <div className="dashboard">
            <h2>Welcome to Student Dashboard</h2>
           
           <div className="dashboard-menu">
                <Link to="profile" className="button-link">
                    Profile
                </Link>

                <Link to="my-courses" className="button-link">
                    My Courses
                </Link>

                <Link to="settings" className="button-link">
                    Settings
                </Link>

                {/* <button onClick={handleLogout}>Logout</button> */}
            </div>
            <Outlet/>

        </div>
    );
}