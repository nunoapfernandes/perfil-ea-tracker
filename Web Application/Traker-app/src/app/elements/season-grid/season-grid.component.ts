

import {Component, Input} from '@angular/core';
import 'rxjs/Rx'

@Component({
  selector: 'app-season-grid',
  templateUrl: './season-grid.component.html',
  styleUrls: ['./season-grid.component.css']
})

export class SeasonGridComponent {
  @Input()
  media: Object = {};

  constructor() {
  }
}
