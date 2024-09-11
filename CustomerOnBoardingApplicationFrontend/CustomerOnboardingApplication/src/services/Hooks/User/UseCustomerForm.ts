import { useMutation } from "react-query";
import { CustomerForm } from "../../../Pages/Customer/Types/CustomerForm";

export const customerFormUrl= 'https://localhost:7027/api/customer/customerFormSubmission';
const customerForm = async (values: CustomerForm): Promise<CustomerForm | null> => {
  const data = JSON.stringify(
    {
      "MainPurposeForApplyingAtMcb": values?.mainPurposeForApplyingAtMcb,
      "NameOfApplicant": values?.nameOfApplicant,
      "Email": values?.email,
      "ApplicationDate": values?.ApplicationDate,
      "FileName": values?.FileName,
      "PassportNumberOfDirectors": values?.PassportNumberOfDirectors,
      "StatusOfApplication": values?.StatusOfApplication,
      "BusinessActivity": values?.businessActivity,
      "CountryName": values?.countryName,
      "CountryOfIncorporation": values?.countryOfIncorporation,
      "DateOfIncorporation": values?.dateOfIncorporation,
      "Documents": values?.documents,
      "License": values?.license,
      "NameOfCompany": values?.nameOfCompany,
      "NameOfDirectorOrShareholders": values?.nameOfDirectorOrShareholders,
      "RegistrationNumber": values?.registrationNumber,
      "TypeOfEntity": values?.typeOfEntity,
    }
  );
  const response = await fetch(customerFormUrl, {
    method: 'POST',
    body: data,
    headers: { "Content-Type":"application/json", "Accept":"application/json", "Access-Cross-Allow-Origin":"*"}
  });
  
 /*  if(response.status === 204){
    console.log("Status 204");
    return null;
  } */
  /* else{ */
  console.log("response api: ");
  return response.status===204? null: response.json();
  //}

  //console.log('response: ',response)

 /*  const { data } = await axios.post(userLoginUrl, values);
  console.log(data);
  return data; */
};

export function useCustomerForm() {
  const { isLoading, mutateAsync } = useMutation(customerForm);
  return { isSubmittingForm: isLoading, customerForm: mutateAsync };
}
