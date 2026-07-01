import { useParams,useNavigate } from "react-router-dom";
import { courses } from "../data/course";

export function CourseDetails(){
    const{courseId}=useParams();
    const navigate=useNavigate();
    const course=courses.find((c)=>c.id===Number(courseId));
    if(!course){
        return(
            <div>
                <h2>Course Not found</h2>
                <button onClick={()=>navigate("/courses")}>
                    Back to courses
                </button>
            </div>
        )
    }
    return(
        <div className="course-details">
            <h2>Course Details</h2>
            <p><strong>CourseID:</strong>{course.id}</p>
            <p><strong>Title:</strong>{course.title}</p>
            <p><strong>Category:</strong>{course.category}</p>
            <p><strong>Duration:</strong>{course.duration}</p>
            <p><strong>Trainer:</strong>{course.trainer}</p>
            <p><strong>Description:</strong>{course.description}</p>
            <button onClick={()=>navigate("/courses")}>
                Back to Courses
            </button>

        </div>
    );

}