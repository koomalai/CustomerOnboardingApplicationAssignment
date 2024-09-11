import { Avatar, Box, Button, Container, CssBaseline, FormControl, InputLabel, MenuItem, Select, SelectChangeEvent, TextField, ThemeProvider, Typography, createTheme } from "@mui/material";
import Grid from '@mui/material/Grid2';
import { Link, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { useFormik } from "formik";
import { LoadingButton } from "@mui/lab";
import * as Yup from "yup";
import { useCustomerForm } from "../../services/Hooks/User/UseCustomerForm";
import { useSnackbar } from "../../shared/components/Contexts/SnackbarProvider";
import { Country } from "./Types/Country";
import { CustomerForm } from "./Types/CustomerForm";

const Copyright = (props: any) => {
  return (
    <Typography
      variant="body2"
      color="text.secondary"
      align="center"
      {...props}
    >
      {"Copyright © "}
      <Link color="inherit" to="/homepage">
        MCB
      </Link>{" "}
      {new Date().getFullYear()}
      {"."}
    </Typography>
  );
};

const Customer = () => {
  const defaultTheme = createTheme();

  const {isSubmittingForm, customerForm } = useCustomerForm();
  const navigate = useNavigate();
  const snackbar = useSnackbar();

  const [purpose, setPurpose] = useState('');
  const [countries, setCountries] = useState<Country[]>([]);
  const [selectedCountry, setSelectedCountry] = useState('');
  const [selectBusinessActivity, setSelectBusinessActivity] = useState('');
  const [selectedFile, setSelectedFile] = useState(null);
  const [fileName, setFileName] = useState('');

  const mainPurposeForApplyingAtMcb = [
    { label: "Investment portfolio", value: "Investment portfolio" },
    { label: "Account to operate locally", value: "Account to operate locally" },
    { label: "Account to operate overseas", value: "Account to operate overseas" },
    { label: "Energy & commodities financing", value: "Energy & commodities financing" },
  ];

  const businessActivity = [
    { label: "Banking", value: "Banking" },
    { label: "Fishing", value: "Fishing" },
    { label: "Manufacturing", value: "Manufacturing" },
  ];

  const handlePurposeChange = (event: SelectChangeEvent) => {
    setPurpose(event.target.value as string);
  };

  const handleBusinessActivityChange = (event: SelectChangeEvent) => {
    setSelectBusinessActivity(event.target.value as string);
  };

  const fetchCountries = async () => {
    try {
      const response = await fetch('https://localhost:7027/api/country/getAllCountry');
      const data = await response.json();
      setCountries(data);
    } catch (err) {
      snackbar.showSnackBar("Error to fetch countries", "error", "Error Message")
    }
  }

  useEffect(() => {
    fetchCountries();
  }, []);

  const handleCountryChange = (event: SelectChangeEvent) => {
    setSelectedCountry(event.target.value);
  };

  const handleFileChange = (event: any) => {
    const file = event.target.files[0];
    if (file) {
      setSelectedFile(file);
      setFileName(file.name);
    }
  };

   const handleFormSubmit = (Values: CustomerForm) => {
     customerForm(Values)
       .then((response: any) => {
         if (response) {
           console.log('response',response);
           localStorage.setItem("user", JSON.stringify(response));
           navigate('/homepage');
           snackbar.showSnackBar("Welcome to My Medical Shop", "success", "Success Message");
         }
         else{
           console.log('Details Error');
           snackbar.showSnackBar("Error to submit form", "error", "Error Message");
         }
       })
       .catch(() =>
         {
           console.log('catch err')
           
           snackbar.showSnackBar("Cannot submit", "error", "Error Message")}
       );
   };
 
  const formik = useFormik({
    initialValues: {
      mainPurposeForApplyingAtMcb: '',
      nameOfCompany: '',
      typeOfEntity: '',
      businessActivity: '',
      license: '',
      countryOfIncorporation: '',
      registrationNumber: '',
      dateOfIncorporation: new Date(),
      nameOfDirectorOrShareholders: '',
      PassportNumberOfDirectors: '',
      nameOfApplicant: '',
      email: '',
      documents: [],
      FileName: '',
      countryName: "",
      ApplicationDate: new Date(),
      StatusOfApplication: ''
    },
    validationSchema: Yup.object({
      email: Yup.string()
        .email("Email not valid")
        .required("Email is required")
        .matches(
          /^[A-Z0-9._%+-]+@(gmail|yahoo|outlook|hotmail)+\.(com)$/i,
          "Email does not match format"
        ),
      mainPurposeForApplyingAtMcb: Yup.string()
        .required("mainPurposeForApplyingAtMcb is required"),
      nameOfCompany: Yup.string()
        .required("Name Of company is required"),
      typeOfEntity: Yup.string()
        .required("Type Of Entity is required"),
      businessActivity: Yup.string()
        .required("BusinessActivity is required"),
      countryOfIncorporation: Yup.string()
        .required("Country Of Incorporation is required"),
      registrationNumber: Yup.string()
        .required("Registration Number is required"),
      dateOfIncorporation: Yup.string()
        .required("Date of incorporation is required"),
      nameOfDirectorOrShareholders: Yup.string()
        .required("Name of Director is required"),
      PassportNumberOfDirectors: Yup.string()
        .required("Passport Number Of Director is required"),
      nameOfApplicant: Yup.string()
        .required("Name Of Designated Applicant is required"),
    }),
    onSubmit: (values: CustomerForm) => handleFormSubmit(values),
  });

  return (
    <ThemeProvider theme={defaultTheme}>
      <Container component="main" maxWidth="xs">
        <CssBaseline />
        <Box
          sx={{
            marginTop: 0.5,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
          }}
        >
          <Avatar sx={{ m: 1.5, bgcolor: "secondary.main" }}></Avatar>
          <Typography component="h1" variant="h5" data-testid="login_text">
            Nice to meet you
          </Typography>
          <Box
            component="form"
            noValidate
            onSubmit={formik.handleSubmit}
            sx={{ mt: 3 }}
          >
            <FormControl fullWidth>
              <InputLabel>Main Purpose For Applying At MCB</InputLabel>
              <Select
                style={{ textAlign: "center" }}
                value={purpose}
                onChange={(e: any) => handlePurposeChange(e)}
                variant="outlined"
                label="Main Purpose For Applying At MCB"
                required
                error={formik.touched.mainPurposeForApplyingAtMcb && Boolean(formik.errors.mainPurposeForApplyingAtMcb)}
              >
                {mainPurposeForApplyingAtMcb.map((purpose) => (
                  <MenuItem key={purpose.label} value={purpose.value}>
                    {purpose.label}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>

            <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }} sx={{ mt: 1.5 }}>
              <Grid size={{ xs: 6 }}>
                <TextField
                  id="Name Of Company"
                  label="Name Of Company"
                  name="Name Of Company"
                  autoComplete="Name Of Company"
                  required
                  fullWidth
                  value={formik.values.nameOfCompany}
                  onChange={formik.handleChange}
                  onBlur={formik.handleBlur}
                  error={formik.touched.nameOfCompany && Boolean(formik.errors.nameOfCompany)}
                  helperText={formik.touched.nameOfCompany && formik.errors.nameOfCompany}
                />
              </Grid>
              <Grid size={{ xs: 6 }}>
                <TextField
                  id="Type Of Entity"
                  label="Type Of Entity"
                  name="Type Of Entity"
                  autoComplete="Type Of Entity"
                  required
                  fullWidth
                  value={formik.values.typeOfEntity}
                  onChange={formik.handleChange}
                  onBlur={formik.handleBlur}
                  error={formik.touched.typeOfEntity && Boolean(formik.errors.typeOfEntity)}
                  helperText={formik.touched.typeOfEntity && formik.errors.typeOfEntity}
                />
              </Grid>
            </Grid>
            <Box sx={{ display: 'flex', gap: 1 }}>
              <FormControl fullWidth sx={{ mt: 1.5 }}>
                <InputLabel>Business Activity</InputLabel>
                <Select
                  style={{ textAlign: "center" }}
                  value={selectBusinessActivity}
                  onChange={(e: any) => handleBusinessActivityChange(e)}
                  variant="outlined"
                  label="Country Of Incorporation"
                  required
                  error={formik.touched.businessActivity && Boolean(formik.errors.businessActivity)}
                >
                  {businessActivity?.map((activity) => (
                    <MenuItem key={activity.label} value={activity.value}>
                      {activity.label}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
              <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }} sx={{ mt: 1.5 }}>
                <Grid size={{ xs: 12 }}>
                  <TextField
                    id="License"
                    label="License If Activity Is Banking"
                    name="License"
                    autoComplete="License"
                    fullWidth
                    value={formik.values.license}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    error={formik.touched.license && Boolean(formik.errors.license)}
                    helperText={formik.touched.license && formik.errors.license}
                  />
                </Grid>
              </Grid>
            </Box>
            <Box sx={{ display: 'flex', gap: 1 }}>
              <FormControl fullWidth sx={{ mt: 1.5 }}>
                <InputLabel>Country Of Incorporation</InputLabel>
                <Select
                  style={{ textAlign: "center" }}
                  value={selectedCountry}
                  onChange={(e: any) => handleCountryChange(e)}
                  variant="outlined"
                  label="Country Of Incorporation"
                  required
                >
                  {countries?.map((country) => (
                    <MenuItem key={country.countryId} value={country.countryOfIncorporation}>
                      {country.countryOfIncorporation}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
              <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }} sx={{ mt: 1.5 }}>
                <Grid size={{ xs: 12 }}>
                  <TextField
                    id="Registration Number"
                    label="Registration Number"
                    name="Registration Number"
                    autoComplete="Registration Number"
                    required
                    fullWidth
                    value={formik.values.registrationNumber}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    error={formik.touched.registrationNumber && Boolean(formik.errors.registrationNumber)}
                    helperText={formik.touched.registrationNumber && formik.errors.registrationNumber}
                  />
                </Grid>
              </Grid>
            </Box>
            <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }} sx={{ mt: 1.5 }}>
              <Grid size={{ xs: 6 }}>
                <TextField
                  id="Date of incorporation"
                  label="Date of incorporation"
                  name="Date of incorporation"
                  autoComplete="Date of incorporation"
                  required
                  fullWidth
                  value={formik.values.dateOfIncorporation}
                  onChange={formik.handleChange}
                  onBlur={formik.handleBlur}
                  error={formik.touched.dateOfIncorporation && Boolean(formik.errors.dateOfIncorporation)}
                  //helperText={formik.touched.dateOfIncorporation && formik.errors.dateOfIncorporation}
                />
              </Grid>
              <Grid size={{ xs: 6 }}>
                <TextField
                  id="Name of Director/ Shareholders"
                  label="Name of Director/ Shareholders"
                  name="Name of Director/ Shareholders"
                  autoComplete="Name of Director/ Shareholders"
                  required
                  fullWidth
                  value={formik.values.nameOfDirectorOrShareholders}
                  onChange={formik.handleChange}
                  onBlur={formik.handleBlur}
                  error={formik.touched.nameOfDirectorOrShareholders && Boolean(formik.errors.nameOfDirectorOrShareholders)}
                  helperText={formik.touched.nameOfDirectorOrShareholders && formik.errors.nameOfDirectorOrShareholders}
                />
              </Grid>
            </Grid>

            <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }} sx={{ mt: 1.5 }}>

              <Grid size={{ xs: 6 }}>
                <TextField
                  id="Passport number of directors"
                  label="Passport number of directors"
                  name="Passport number of directors"
                  autoComplete="Passport number of directors"
                  required
                  fullWidth
                  value={formik.values.PassportNumberOfDirectors}
                  onChange={formik.handleChange}
                  onBlur={formik.handleBlur}
                  error={formik.touched.PassportNumberOfDirectors && Boolean(formik.errors.PassportNumberOfDirectors)}
                  helperText={formik.touched.PassportNumberOfDirectors && formik.errors.PassportNumberOfDirectors}
                />
              </Grid>
              <Grid size={{ xs: 6 }}>
                <TextField
                  id="Name of designated applicant"
                  label="Name of designated applicant"
                  name="Name of designated applicant"
                  autoComplete="Name of designated applicant"
                  required
                  fullWidth
                  value={formik.values.nameOfApplicant}
                  onChange={formik.handleChange}
                  onBlur={formik.handleBlur}
                  error={formik.touched.nameOfApplicant && Boolean(formik.errors.nameOfApplicant)}
                  helperText={formik.touched.nameOfApplicant && formik.errors.nameOfApplicant}
                />
              </Grid>
            </Grid>
            <Box sx={{ display: 'flex', gap: 1 }}>
              <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }} sx={{ mt: 1.5 }}>

                <Grid size={{ xs: 6 }}>
                  <TextField
                    id="Email"
                    label="Email"
                    name="Email"
                    autoComplete="Email"
                    required
                    fullWidth
                    value={formik.values.email}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    error={formik.touched.email && Boolean(formik.errors.email)}
                    helperText={formik.touched.email && formik.errors.email}
                  />
                </Grid>
                <Box sx={{ p: 2 }}>
                  <input
                    accept="*/*"
                    type="file"
                    id="file-upload"
                    onChange={handleFileChange}
                    style={{ display: 'none' }}
                  />
                  <label htmlFor="file-upload">
                    <Button variant="contained" component="span">
                      Upload File
                    </Button>
                  </label>
                  <Typography variant="body1" sx={{ mt: 2 }}>
                    {fileName ? `Selected File: ${fileName}` : 'No file selected'}
                  </Typography>

                </Box>
              </Grid>
            </Box>



            <LoadingButton
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 1.5, mb: 1.5 }}
              loading={isSubmittingForm}
              loadingIndicator='Loading...'
              data-testid="login-submit"
              disabled={!(formik.values.email && formik.values.businessActivity && 
                formik.values.countryOfIncorporation && formik.values.dateOfIncorporation && 
                formik.values.mainPurposeForApplyingAtMcb && formik.values.nameOfCompany &&
                formik.values.nameOfApplicant && formik.values.nameOfDirectorOrShareholders &&
                formik.values.PassportNumberOfDirectors && formik.values.registrationNumber && formik.values.typeOfEntity 
                && formik.isValid)}
            >
              Submit
            </LoadingButton>
          </Box>
        </Box>
        <Copyright sx={{ mt: 2 }} />
      </Container>
    </ThemeProvider>
  );
}
export default Customer;
