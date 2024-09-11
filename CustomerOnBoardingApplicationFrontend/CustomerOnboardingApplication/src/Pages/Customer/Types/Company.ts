export interface Company{
    companyId: number;
    nameOfCompany: string;
    countryName: string
    typeOfEntity: string;
    businessActivity: "Banking" | "Fishing" | "Manufacturing";
    license: string | null;
    registrationNumber: string;
    dateOfIncorporation: Date;
}