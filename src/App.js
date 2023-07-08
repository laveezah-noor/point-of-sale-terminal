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
    <div className='flex '>
      <Sidebar/>

      {/* Main Page */}
      <div className='container mx-auto px-6 bg-gray-200'>
        <RouterProvider router={router} />
      </div>
    </div>
    );
}

export default App;
