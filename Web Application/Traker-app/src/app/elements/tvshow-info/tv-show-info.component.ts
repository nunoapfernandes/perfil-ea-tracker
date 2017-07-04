
import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-tv-show-info',
  templateUrl: './tv-show-info.component.html',
  styleUrls: ['./tv-show-info.component.css']
})

export class TvShowInfoComponent {
  @Input()
  media: Object = {};

  constructor() {
  }
}

