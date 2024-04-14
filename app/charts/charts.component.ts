
import { Component, OnInit } from '@angular/core';
import * as echarts from 'echarts';

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.css']
})
export class ChartsComponent implements OnInit {
  constructor(){}
  ngOnInit(): void {

 

type EChartsOption = echarts.EChartsOption;

var chartDom = document.getElementById('main')!;
var myChart = echarts.init(chartDom);
var option: EChartsOption;

option = {
 
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: '100%',
      data: [
        { value: 250, name: 'Paella' },
        { value: 120, name: 'Cheese pizza' },
        { value: 70, name: 'Fried potatoes ' },
        { value: 200, name: 'Vegetables pizza' },
        { value: 170, name: 'Meatball' },
        { value: 80, name: 'Couscous with fish' },
        { value: 150, name: 'Inari sushi' },
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
};

option && myChart.setOption(option);

    
    
    
};




}



