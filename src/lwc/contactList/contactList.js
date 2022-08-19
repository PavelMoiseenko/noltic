import {LightningElement} from 'lwc';

export default class ContactList extends LightningElement {
    contacts = [
        {
            id: 1,
            firstName: 'Ann',
            lastName: 'Tarasenko',
            phone: '05021122120',
            year: 1990
        },
        {
            id: 2,
            firstName: 'Daria',
            lastName: 'Petrenko',
            phone: '06631122120',
            year: 1985
        },
        {
            id: 3,
            firstName: 'Ivanna',
            lastName: 'Nazarenko',
            phone: '06741122120',
            year: 1998
        },
        {
            id: 4,
            firstName: 'Maria',
            lastName: 'Klimenko',
            phone: '06851122120',
            year: 1997
        }
    ]
}