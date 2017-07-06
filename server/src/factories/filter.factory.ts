import { CompanyFilter } from '../models/filters';

export default class FilterFactory {

    static GetCompanyFilter(filterInfo: any): CompanyFilter | undefined {
        if (!filterInfo) return undefined;

        let filter: CompanyFilter = new CompanyFilter(
            filterInfo.Name || undefined,
            filterInfo.DishTypeIds || undefined,
            filterInfo.MinRate || undefined,
            filterInfo.Skip || undefined,
            filterInfo.Amount || undefined,
            filterInfo.Sorting || undefined
        );

        return filter;
    }
}