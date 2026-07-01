import { useNavigate } from "react-router-dom";

export function NotFound() {
  const navigate = useNavigate();

  return (
    <div className="not-found">
      <h2>404 - Page Not Found</h2>

      <p>The page you are looking for does not exist.</p>

      <button onClick={() => navigate("/")}>
        Go to Home
      </button>
    </div>
  );
}