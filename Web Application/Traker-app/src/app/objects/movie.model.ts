import { Genre } from './genre.model'

export class Movie {
    id:number;
    title: string;

    release_date: Date;

    runtime: number;
    rating: number;
    comments: number;

    certification: string;
    language: string;

    genres: Genre[];

    tagline: string;

    overview:string;
    trailer: string;

}
