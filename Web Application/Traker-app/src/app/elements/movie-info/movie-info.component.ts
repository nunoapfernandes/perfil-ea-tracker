
import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-movie-info',
  templateUrl: './movie-info.component.html',
  styleUrls: ['./movie-info.component.css']
})

export class MovieInfoComponent {
    @Input()
    media: Object = {};

    constructor() {
    }
}
