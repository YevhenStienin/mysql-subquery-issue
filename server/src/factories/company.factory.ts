import { Company } from '../models/company';

export default class CompanyFactory {

    static GetFullInfo(companyInfo: any): Company {
        if (!companyInfo) { throw new Error("Company info is empty."); }
        if (!companyInfo.Id) { throw new Error("Company's Id is empty."); }

        return new Company(
            companyInfo.Id,
            companyInfo.Name,
            companyInfo.Description,
            companyInfo.Phones.split("/"),
            companyInfo.Website,
            companyInfo.Address,
            companyInfo.Logo,
            companyInfo.Rate,
            companyInfo.Likes,
            companyInfo.Dislikes);
    }
}