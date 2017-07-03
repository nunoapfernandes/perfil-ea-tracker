import { genre } from './genre'

export class movie {
    id:number;
    title: string;

    release_date: Date;

    runtime: number;
    rating: number;
    comments: number;

    certification: string;
    language: string;

    genres: genre[];

    tagline: string;

    overview:string;
    trailer: string;

}