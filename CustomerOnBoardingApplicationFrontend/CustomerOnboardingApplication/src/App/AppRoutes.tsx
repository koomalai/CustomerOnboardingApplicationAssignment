import { Route, Routes } from "react-router-dom";
import Customer from "../Pages/Customer/Customer";

function AppRouters() {
  return (
    <Routes>
      <Route path="/" element={<Customer />} />
    </Routes>
  );
}
export default AppRouters;