import './App.css';
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import Sidebar from './components/sidebar';
import Navbar from './components/navbar';
import routes from './routes'

const router = createBrowserRouter(routes);

function App() {
  return (
    <div className=''>
      <Sidebar className="">
      {/* Main Page */}
      <Navbar/>
      <div className='bg-gray-200'>
        <RouterProvider router={router} />
      </div>
      {/* <div className='bg-white grid-cols-3 col-span-8 h-screen w-full'></div> */}
      </Sidebar>
    </div>
    );
}

export default App;
