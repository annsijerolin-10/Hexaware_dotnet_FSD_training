export function Profile() {
    const user=JSON.parse(localStorage.getItem("user"))
  return (
    <div className="profile">
      <h2>Student Profile</h2>
      <p><strong>Name:</strong> {user?.username}</p>
      <p><strong>Email:</strong> student@example.com</p>
      <p><strong>Course:</strong> React JS Fundamentals</p>
      <p><strong>Status:</strong> Active</p>
    </div>
  );
}