import './App.css';
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import Sidebar from './components/sidebar';
import Navbar from './components/navbar';
<<<<<<< HEAD
import {ReportPage} from './routes/report-page';
import { ProductsPage } from './routes/products-page';
import  {newProductPage}  from './routes/newProduct-page';
import { OrderPage } from './routes/order-page';

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
  {
    path: "/newEntry",
    element: <NewEntryPage/>,
    errorElement: <ErrorPage/>
  },
  {
    path: "/product",
    element: <ProductsPage/>,
    errorElement: <ErrorPage/>
  },
  {
    path: "/newProduct",
    element: <newProductPage/>,
    errorElement: <ErrorPage/>
  },
  {
    path: "/newOrder",
    element: <OrderPage/>,
    errorElement: <ErrorPage/>
  },
  {
    path: "/reports",
    element: <ReportPage/>,
    errorElement: <ErrorPage/>
  },
]);
=======
import routes from './routes'

const router = createBrowserRouter(routes);
>>>>>>> master

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
