import './App.css';
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import DashboardPage from './routes/dashboard-page';
import InventoryPage from './routes/inventory-page';
import ErrorPage from './routes/error-page';
import Sidebar from './components/sidebar';

const router = createBrowserRouter([
  {
    path: "/",
    element: <DashboardPage/>,
    errorElement: <ErrorPage/>
  },
  {
    path: "/inventory",
    element: <InventoryPage/>,
    errorElement: <ErrorPage/>
  },
]);

function App() {
  return (
    <div className=''>
      <Sidebar className="">
      {/* Main Page */}
      <div className='px-4 bg-gray-200'>
        <RouterProvider router={router} />
      </div>
      {/* <div className='bg-white grid-cols-3 col-span-8 h-screen w-full'></div> */}
      </Sidebar>
    </div>
    );
}

export default App;
