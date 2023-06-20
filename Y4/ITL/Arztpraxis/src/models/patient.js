import { doesNotMatch } from 'assert';
import { db } from './db';

export default class Patient {
	constructor(id, firstname, lastname, svnr, birthday) {
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.svnr = svnr;
		this.birthday = birthday;
	}

	/**
	 * Gets all patients.
	 * @returns {Promise<Patient[]>|Error} The patients or an error.
	 */
	static async getAll() {
		const [rows] = await db.query('SELECT * FROM person');
		if (rows.length === 0) throw new Error('Es wurden keine Patienten gefunden.');
		return rows.map((row) => new Patient(row.id, row.firstname, row.lastname, row.svnr, row.birthday));
	}

	/**
	 * Gets a patient by id.
	 * @param {*} id
	 * @returns {Promise<Patient>|Error} The patient or an error.
	 */
	static async getById(id) {
		const [rows] = await db.query('SELECT * FROM person WHERE id = ?', [id]);
		if (rows.length === 0) throw new Error('Es wurde kein Patient mit dieser ID gefunden.');
		return new Patient(rows[0].id, rows[0].firstname, rows[0].lastname, rows[0].svnr, rows[0].birthday);
	}

	/**
	 * Gets a patient by id.
	 */
	static async getBySVNR(svnr, birthday) {
		const [rows] = await db.query('SELECT * FROM person WHERE svnr = ? AND geburtsdatum = ?', [svnr, birthday]);
		if (rows.length === 0) throw new Error('Es wurde kein Patient mit dieser SVNr gefunden.');
		return new Patient(rows[0].id, rows[0].firstname, rows[0].lastname, rows[0].svnr, rows[0].birthday);
	}

	/**
	 * Gets Behandlungsdaten of a patient within a time range.
	 */
	static async getBehandlungsdaten(svnr, birthday, start, end, timerange = false) {
		let behandlungsdaten = [];

		if (timerange) {
			const [rows] = await db.query(
				`SELECT concat(b.beginn, ' - ', IF(b.ende IS NULL, 'laufend', b.ende)) as "Zeitraum", concat(p.vorname, ' ', p.nachname) as "Patient", concat(p.svnr, '/', p.geburtsdatum) as "SVNr", d.name as "Diagnose"
			FROM person p, diagnose d, behandlungszeitraum b
			WHERE b.person_id = p.id
				AND b.diagnose_id = d.id
				AND p.svnr = ?
				AND p.geburtsdatum = ?
				AND date(b.beginn) between ? and ?
			ORDER BY beginn desc;`,
				[svnr, birthday, start, end]
			);

			if (rows.length === 0) throw new Error('Es wurden keine Behandlungsdaten gefunden.');

			rows.forEach((row) => {
				behandlungsdaten.push({
					zeitraum: row.Zeitraum,
					patient: row.Patient,
					svnr: row.SVNr,
					diagnose: row.Diagnose
				});
			});
		} else {
			if (!start && !end) {
				const [rows] = await db.query(
					`SELECT concat(b.beginn, ' - ', IF(b.ende IS NULL, 'laufend', b.ende)) as "Zeitraum", concat(p.vorname, ' ', p.nachname) as "Patient", concat(p.svnr, '/', p.geburtsdatum) as "SVNr", d.name as "Diagnose"
				FROM person p, diagnose d, behandlungszeitraum b
			   WHERE b.person_id = p.id
				 AND b.diagnose_id = d.id
				 AND p.svnr = ?
				 AND p.geburtsdatum = ?
			ORDER BY beginn desc;`,
					[svnr, birthday]
				);
				if (rows.length === 0) throw new Error('Es wurden keine Behandlungsdaten gefunden.');

				rows.forEach((row) => {
					behandlungsdaten.push({
						zeitraum: row.Zeitraum,
						patient: row.Patient,
						svnr: row.SVNr,
						diagnose: row.Diagnose
					});
				});
			} else if (start && !end) {
				const [rows] = await db.query(
					`SELECT concat(b.beginn, ' - ', IF(b.ende IS NULL, 'laufend', b.ende)) as "Zeitraum", concat(p.vorname, ' ', p.nachname) as "Patient", concat(p.svnr, '/', p.geburtsdatum) as "SVNr", d.name as "Diagnose"
				FROM person p, diagnose d, behandlungszeitraum b
				  WHERE b.person_id = p.id
					AND b.diagnose_id = d.id
					AND p.svnr = ?
					AND p.geburtsdatum = ?
					AND date(b.beginn) >= ?
				ORDER BY beginn desc;`,
					[svnr, birthday, start]
				);

				if (rows.length === 0) throw new Error('Es wurden keine Behandlungsdaten gefunden.');

				rows.forEach((row) => {
					behandlungsdaten.push({
						zeitraum: row.Zeitraum,
						patient: row.Patient,
						svnr: row.SVNr,
						diagnose: row.Diagnose
					});
				});
			} else if (!start && end) {
				const [rows] = await db.query(
					`SELECT concat(b.beginn, ' - ', IF(b.ende IS NULL, 'laufend', b.ende)) as "Zeitraum", concat(p.vorname, ' ', p.nachname) as "Patient", concat(p.svnr, '/', p.geburtsdatum) as "SVNr", d.name as "Diagnose"
				FROM person p, diagnose d, behandlungszeitraum b
					WHERE b.person_id = p.id
					AND b.diagnose_id = d.id
					AND p.svnr = ?
					AND p.geburtsdatum = ?
					AND b.ende <= ?
				ORDER BY beginn desc;`,
					[svnr, birthday, end]
				);

				if (rows.length === 0) throw new Error('Es wurden keine Behandlungsdaten gefunden.');

				rows.forEach((row) => {
					behandlungsdaten.push({
						zeitraum: row.Zeitraum,
						patient: row.Patient,
						svnr: row.SVNr,
						diagnose: row.Diagnose
					});
				});
			} else if (start && end) {
				const [rows] = await db.query(
					`SELECT concat(b.beginn, ' - ', IF(b.ende IS NULL, 'laufend', b.ende)) as "Zeitraum", concat(p.vorname, ' ', p.nachname) as "Patient", concat(p.svnr, '/', p.geburtsdatum) as "SVNr", d.name as "Diagnose"
				FROM person p, diagnose d, behandlungszeitraum b
					WHERE b.person_id = p.id
					AND b.diagnose_id = d.id
					AND p.svnr = ?
					AND p.geburtsdatum = ?
					AND b.beginn >= ?
					AND b.ende <= ?
				ORDER BY beginn desc;`,
					[svnr, birthday, start, end]
				);

				if (rows.length === 0) throw new Error('Es wurden keine Behandlungsdaten gefunden.');

				rows.forEach((row) => {
					behandlungsdaten.push({
						zeitraum: row.Zeitraum,
						patient: row.Patient,
						svnr: row.SVNr,
						diagnose: row.Diagnose
					});
				});
			} else {
				throw new Error('Es wurden keine Behandlungsdaten gefunden.');
			}
		}

		return behandlungsdaten;
	}
}
