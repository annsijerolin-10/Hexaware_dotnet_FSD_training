import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import heroImg from './assets/hero.png'
import './App.css'
import { About } from './pages/About'
import { Contact } from './pages/Contact'
import { CourseDetails } from './pages/CourseDetails'
import { Courses } from './pages/Courses'
import { Dashboard } from './pages/Dashboard'
import { Home } from './pages/Home'
import { Login } from './pages/Login'
import { MyCourses } from './pages/Mycourses'
import { NotFound } from './pages/NotFound'
import { Profile } from './pages/Profile'
import { Settings } from './pages/Settings'
import { ProtectedRoute } from './layouts/ProtectedRoute'
import { Navbar } from './components/Navbar'
import { Route,Routes,Navigate } from 'react-router-dom'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
    <Navbar/>
     <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/courses" element={<Courses />} />
        <Route path="/courses/:courseId" element={<CourseDetails />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/login" element={<Login />} />

        <Route
          path="/dashboard"
          element={
            <ProtectedRoute>
              <Dashboard />
            </ProtectedRoute>
          }
        >
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="profile" element={<Profile />} />
          <Route path="my-courses" element={<MyCourses />} />
          <Route path="settings" element={<Settings />} />
        </Route>
        <Route path="*" element={<NotFound />} />
      </Routes>


      
    </>
  )
}

export default App
