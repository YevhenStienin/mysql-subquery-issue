export class CompanyFilter {
        public Name: string;
        public Skip: number;
        public DishTypeIds: string[];
        public MinRate: number;
        public Amount: number;
        public Sorting: Sorting[];
    constructor(Name: string, DishTypeIds: string[], MinRate: number, Skip: number, Amount: number, Sorting: Sorting[]) {
        this.Name = Name;
        this.DishTypeIds = DishTypeIds;
        this.MinRate = MinRate;
        this.Skip = Skip;
        this.Amount = Amount;
        this.Sorting = Sorting;
    }
}

export enum SortDirection {
    ASC = 0,
    DESC = 1
}

export class Sorting {
    public Field: string;
    public Direction: SortDirection;
}