import { db } from './db';

export default class Schema {
	// constructor(id, firstname, lastname, username, email, password, optedIn) {
	// 	this.id = id;
	// 	this.firstname = firstname;
	// 	this.lastname = lastname;
	// 	this.username = username;
	// 	this.email = email;
	// 	this.password = password;
	// 	this.optedIn = optedIn;
	// }

	static async exists(schema) {
		const [rows] = await db.query('show schemas like ?', [schema]);
		return rows.length > 0;
	}

	// get all schemas
	static async getAll() {
		const [rows] = await db.query('show schemas;');
		if (rows.length === 0) return null;
		return rows;
	}

	// get all tables
	static async getTables(schema) {
		const [rows] = await db.query('show tables from ??', [schema]);
		if (rows.length === 0) return null;

		return rows;
	}

	static async describeTable(table) {
		// template.user

		let schema = table.split('.', 1)[0];
		await db.query('use ??', [schema]);

		const [rows] = await db.query('describe ??', [table]);
		if (rows.length === 0) return null;

		return rows;
	}

	static async selectTable(table) {
		let schema = table.split('.', 1)[0];
		await db.query('use ??', [schema]);

		const [rows] = await db.query('select * from ??', [table]);
		if (rows.length === 0) return null;

		return rows;
	}
}
