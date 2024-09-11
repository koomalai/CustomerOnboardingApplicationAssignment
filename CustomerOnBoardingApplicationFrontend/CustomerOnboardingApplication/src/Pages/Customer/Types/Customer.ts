export interface Customer {
    customerId: number;
    mainPurposeForApplyingAtMcb: "Investment portfolio" | "Account to operate locally" | "Account to operate overseas" | "Energy & commodities financing";
    nameOfApplicant: string;
    email: string;
}