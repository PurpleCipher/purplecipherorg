import { Component, OnInit, ChangeDetectionStrategy } from '@angular/core';

@Component({
  selector: 'pcw-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class HomeComponent implements OnInit {
  title = 'Purple Cipher Tech';
  constructor() {}

  ngOnInit(): void {}
}
