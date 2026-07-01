import { courses } from "../data/course";
import { useNavigate } from "react-router-dom";

export function Courses(){
    const navigate=useNavigate();
    return(
        <div>
            <h2>Available Courses</h2>
            {courses.map((course)=>(
                <div key={course.id} className="course-card">
                    <h3>{course.title}</h3>
                    <p><strong>Category:</strong>{course.category}</p>
                    <p><strong>Duration:</strong>{course.duration}</p>
                    <p><strong>Trainer:</strong>{course.trainer}</p>

                    <button onClick={()=>navigate(`/courses/${course.id}`)}>
                        View Details
                    </button>
            </div>
            ))}
        </div>
    );
}