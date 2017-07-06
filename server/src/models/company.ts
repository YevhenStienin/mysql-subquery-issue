
export class Company {
    constructor(
        public Id: number,
        public Name: string,
        public Description: string,
        public Phones: string[],
        public Website: string,
        public Address: string,
        public Logo: string,
        public Rate: number,
        public Likes: number,
        public Dislikes: number) { }
}