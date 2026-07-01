import { useNavigate } from "react-router-dom";

export function Contact(){
    const navigate=useNavigate();
    return(
        <div className="contact">
            <h2>Contact us</h2>
            <p><strong>Email:</strong>support@studentportal.com</p>
            <p><strong>Phone:</strong>9876543210</p>
            <p><strong>Location:</strong>Chennai</p>
            <button onClick={()=>navigate(-1)}>
                Go back
            </button>
        </div>
    );

}