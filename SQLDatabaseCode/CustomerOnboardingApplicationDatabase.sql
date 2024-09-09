--CREATE DATABASE CustomerOnboardingApplication;
USE CustomerOnboardingApplication;

--CREATE TABLE Customer(
--	CustomerId integer PRIMARY KEY,
--	MainPurposeForApplyingAtMCB varchar(250) CHECK(MainPurposeForApplyingAtMCB= 'Investment portfolio' OR MainPurposeForApplyingAtMCB= 'Account to operate 
--locally' OR MainPurposeForApplyingAtMCB= 'Account to operate overseas' OR MainPurposeForApplyingAtMCB= 'Energy & commodities financing'),
--	NameOfCompany varchar(250),
--	TypeOfEntity varchar(250),
--	BusinessActivity varchar(250) CHECK(BusinessActivity= 'Banking' OR BusinessActivity= 'Fishing' OR BusinessActivity= 'Manufacturing'),
--	License varchar(250),
--	CountryOfIncorporation varchar(250),
--	RegistrationNumber varchar(250),
--	DateOfIncorporation DateTime,
--	NameOfDirectorOrShareholders varchar(250),
--	PassportNumberOfDirectors varchar(250),
--	NameOfApplicant varchar(250),
--	Email varchar(250),
--	Documents varbinary(max),
--	StatusOfApplication varchar(250) CHECK(StatusOfApplication= 'Submitted' OR StatusOfApplication= 'In Progress' OR StatusOfApplication= 'Accepted' OR StatusOfApplication= 'Rejected'),
--	DigitalSignature varbinary(max)
--);

SELECT * FROM Customer;