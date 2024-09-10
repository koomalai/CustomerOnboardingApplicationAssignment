--CREATE DATABASE CustomerOnboardingApplication;
USE CustomerOnboardingApplication;

CREATE TABLE Customer(
	CustomerId integer IDENTITY(1,1) PRIMARY KEY,
	MainPurposeForApplyingAtMCB varchar(250) CHECK(MainPurposeForApplyingAtMCB= 'Investment portfolio' OR MainPurposeForApplyingAtMCB= 'Account to operate locally' OR MainPurposeForApplyingAtMCB= 'Account to operate overseas' OR MainPurposeForApplyingAtMCB= 'Energy & commodities financing'),
	NameOfApplicant varchar(250),
	Email varchar(250),
);

CREATE TABLE Director(
	DirectorId Integer IDENTITY(1,1) PRIMARY KEY,
	NameOfDirectorOrShareholders varchar(250),
	PassportNumberOfDirectors varchar(250),
	CustomerId Integer FOREIGN KEY REFERENCES Customer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Application(
	ApplicationId Integer IDENTITY(1,1) PRIMARY KEY,
	ApplicationDate DateTime,
	StatusOfApplication varchar(250) CHECK(StatusOfApplication= 'Submitted' OR StatusOfApplication= 'In Progress' OR StatusOfApplication= 'Accepted' OR StatusOfApplication= 'Rejected'),
	CustomerId Integer FOREIGN KEY REFERENCES Customer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Documents(
	DocumentId integer IDENTITY(1,1) PRIMARY KEY,
	Documents varbinary(max),
	FileName varchar(250),
	DigitalSignature varbinary(max),
	CustomerId Integer FOREIGN KEY REFERENCES Customer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Country(
	CountryId Integer IDENTITY(1,1) PRIMARY KEY,
	CountryOfIncorporation varchar(250),
);

CREATE TABLE Company(
	CompanyId integer IDENTITY(1,1) PRIMARY KEY,
	NameOfCompany varchar(250),
	TypeOfEntity varchar(250),
	BusinessActivity varchar(250) CHECK(BusinessActivity= 'Banking' OR BusinessActivity= 'Fishing' OR BusinessActivity= 'Manufacturing'),
	License varchar(250),
	RegistrationNumber varchar(250),
	DateOfIncorporation DateTime,
	CountryId Integer FOREIGN KEY REFERENCES Country(CountryId) ON UPDATE CASCADE ON DELETE CASCADE,
	CustomerId Integer FOREIGN KEY REFERENCES Customer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Afghanistan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Albania')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Algeria')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'American Samoa')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Andorra')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Angola')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Anguilla')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Antarctica')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Antigua And Barbuda')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Argentina')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Armenia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Aruba')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Australia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Austria')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Azerbaijan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bahamas')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bahrain')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bangladesh')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Barbados')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Belarus')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Belgium')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Belize')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Benin')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bermuda')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bhutan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bolivia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bosnia And Herzegowina')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Botswana')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bouvet Island')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Brazil')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'British Indian Ocean Territory')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Brunei Darussalam')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Bulgaria')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Burkina Faso')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Burundi')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cambodia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cameroon')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Canada')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cape Verde')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cayman Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Central African Republic')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Chad')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Chile')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'China')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Christmas Island')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cocos (Keeling) Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Colombia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Comoros')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Congo')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cook Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Costa Rica')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cote D''Ivoire')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Croatia (Local Name: Hrvatska)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cuba')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Cyprus')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Czech Republic')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Denmark')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Djibouti')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Dominica')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Dominican Republic')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'East Timor')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Ecuador')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Egypt')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'El Salvador')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Equatorial Guinea')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Eritrea')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Estonia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Ethiopia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Falkland Islands (Malvinas)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Faroe Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Fiji')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Finland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'France')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'French Guiana')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'French Polynesia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'French Southern Territories')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Gabon')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Gambia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Georgia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Germany')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Ghana')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Gibraltar')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Greece')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Greenland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Grenada')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Guadeloupe')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Guam')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Guatemala')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Guinea')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Guinea-Bissau')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Guyana')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Haiti')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Heard And Mc Donald Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Holy See (Vatican City State)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Honduras')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Hong Kong')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Hungary')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Iceland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'India')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Indonesia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Iran (Islamic Republic Of)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Iraq')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Ireland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Israel')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Italy')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Jamaica')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Japan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Jordan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Kazakhstan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Kenya')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Kiribati')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Korea, Dem People''S Republic')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Korea, Republic Of')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Kuwait')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Kyrgyzstan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Lao People''S Dem Republic')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Latvia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Lebanon')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Lesotho')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Liberia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Libyan Arab Jamahiriya')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Liechtenstein')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Lithuania')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Luxembourg')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Macau')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Macedonia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Madagascar')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Malawi')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Malaysia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Maldives')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mali')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Malta')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Marshall Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Martinique')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mauritania')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mauritius')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mayotte')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mexico')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Micronesia, Federated States')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Moldova, Republic Of')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Monaco')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mongolia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Montserrat')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Morocco')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Mozambique')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Myanmar')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Namibia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Nauru')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Nepal')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Netherlands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Netherlands Ant Illes')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'New Caledonia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'New Zealand')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Nicaragua')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Niger')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Nigeria')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Niue')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Norfolk Island')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Northern Mariana Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Norway')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Oman')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Pakistan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Palau')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Panama')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Papua New Guinea')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Paraguay')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Peru')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Philippines')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Pitcairn')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Poland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Portugal')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Puerto Rico')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Qatar')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Reunion')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Romania')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Russian Federation')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Rwanda')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Saint K Itts And Nevis')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Saint Lucia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Saint Vincent, The Grenadines')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Samoa')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'San Marino')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Sao Tome And Principe')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Saudi Arabia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Senegal')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Seychelles')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Sierra Leone')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Singapore')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Slovakia (Slovak Republic)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Slovenia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Solomon Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Somalia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'South Africa')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'South Georgia , S Sandwich Is.')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Spain')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Sri Lanka')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'St. Helena')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'St. Pierre And Miquelon')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Sudan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Suriname')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Svalbard, Jan Mayen Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Sw Aziland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Sweden')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Switzerland')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Syrian Arab Republic')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Taiwan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Tajikistan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Tanzania, United Republic Of')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Thailand')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Togo')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Tokelau')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Tonga')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Trinidad And Tobago')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Tunisia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Turkey')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Turkmenistan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Turks And Caicos Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Tuvalu')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Uganda')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Ukraine')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'United Arab Emirates')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'United Kingdom')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'United States')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'United States Minor Is.')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Uruguay')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Uzbekistan')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Vanuatu')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Venezuela')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Viet Nam')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Virgin Islands (British)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Virgin Islands (U.S.)')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Wallis And Futuna Islands')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Western Sahara')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Yemen')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Yugoslavia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Zaire')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Zambia')
GO
INSERT [dbo].[Country] ([CountryOfIncorporation]) VALUES (N'Zimbabwe')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO

--ALTER TABLE Documents
--ADD FileName varchar(250);

--EXEC sp_rename 'Company.CountryId',  'CountryName', 'COLUMN';

--ALTER TABLE Company 
--DROP CONSTRAINT FK__Company__Country__7D439ABD;

--ALTER TABLE Company
--ALTER COLUMN CountryName varchar(250);

SELECT * FROM Country;
SELECT * FROM Customer;
SELECT * FROM Documents;
SELECT * FROM Application;
SELECT * FROM Company;
SELECT * FROM Director;

--DROP TABLE Company;
--DROP TABLE Documents;
--DROP TABLE Application;
--DROP TABLE Director;
--DROP TABLE Customer;
