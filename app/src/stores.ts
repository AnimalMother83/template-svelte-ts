import { writable } from 'svelte/store';

interface ExampleProduct {
	product: string;
	price: number;
}

export const products = writable([]);

const example_products: ExampleProduct[] = [
	{
		product: 'Some product',
		price: 100
	}
];

products.set(example_products);
