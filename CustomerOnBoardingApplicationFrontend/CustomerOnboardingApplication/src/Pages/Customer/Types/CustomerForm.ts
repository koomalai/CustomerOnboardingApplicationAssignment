export interface CustomerForm {
    documents: Blob[];
    FileName: string;
    mainPurposeForApplyingAtMcb: "Investment portfolio" | "Account to operate locally" | "Account to operate overseas" | "Energy & commodities financing"|"";
    nameOfApplicant: string;
    email: string;
    nameOfCompany: string;
    countryName: string
    typeOfEntity: string;
    businessActivity: "Banking" | "Fishing" | "Manufacturing"|"";
    license: string | null;
    registrationNumber: string;
    dateOfIncorporation: Date;
    ApplicationDate: Date;
    StatusOfApplication: string;
    countryOfIncorporation: string;
    nameOfDirectorOrShareholders: string;
    PassportNumberOfDirectors: string;
}