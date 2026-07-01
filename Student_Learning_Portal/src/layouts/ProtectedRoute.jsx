import { Navigate } from "react-router-dom";

export function ProtectedRoute({ children }) {
   const user = JSON.parse(localStorage.getItem("user"));
   localStorage.setItem("user", JSON.stringify(user));

  if (!user || !user.isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  return children;
}