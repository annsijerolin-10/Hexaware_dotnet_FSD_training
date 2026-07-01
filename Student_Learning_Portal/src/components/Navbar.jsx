import { NavLink, useNavigate } from "react-router-dom";

export function Navbar() {
  const navigate = useNavigate();

  const user = JSON.parse(localStorage.getItem("user"));

  function handleLogout() {
    localStorage.removeItem("user");
    navigate("/login");
  }

  return (
    <div className="navbar">

      <NavLink to="/">Home</NavLink>

      <NavLink to="/about">About</NavLink>

      <NavLink to="/courses">Courses</NavLink>

      <NavLink to="/contact">Contact</NavLink>

      {!user ? (
        <NavLink to="/login">Login</NavLink>
      ) : (
        <>
          <NavLink to="/dashboard">Dashboard</NavLink>

          <button onClick={handleLogout}>
            Logout
          </button>
        </>
      )}

    </div>
  );
}