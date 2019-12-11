//----------------------------------------------------------------
// .mongorc.js
//---------------------------------------------
// NOTES:
//---------------------------------------------
// 
//---------------------------------------------
// VIM:
//---------------------------------------------
//
//   Comment:
//   '<,'>g/./s/\(^\s*\)\(\S\)/\1\/\/\2/
//
//   Uncomment:
//   '<,'>s/\(^\s*\)\/\//\1/
//
//----------------------------------------------------------------
'use strict';



//----------------------------------------------------------------
// JSHint Config
//----------------------------------------------------------------
// NOTES:
//
//   NOTE: eqnull is added here to ignore == null.
//
//   NOTE: boss is added here to ignore assignments
//         where comparisons are expected.
//----------------------------------------------------------------
/*jshint node: true, browser: false, nomen: false, eqnull: true, boss: true */
/*global print, printjson*/



//---------------------------------------------
// Config
//---------------------------------------------

var db = db.getSiblingDB('forms');




//---------------------------------------------
// Utility
//---------------------------------------------


/**
 * subclass
 *
 * Creates a New Object Constructor that
 * Inherits from another and
 * Extends it's prototype.
 *
 * @param {Function} N_cont  Child Constructor
 *
 * @param {Function} P_cont  Parent Constructor
 *
 * @param {Object}   proto   Prototype Object
 */
var subclass = function(N_const, P_const, proto) {

    N_const.prototype = new P_const({});

    // Prototype > Props > Extend
    extendProps(N_const.prototype, proto);

    // TODO: OLD WAY
    //for(var prop in proto) {

        //N_const.prototype[prop] = proto[prop];
    //}
};


/**
 * extendProps
 *
 * Copy properties of a Merge-Object into those of a
 * Receiving-Object.
 * Properties that already exist in the Receiving-Object
 * will be overwritten.
 *
 * @param {Object} receiving_obj
 *
 * @param {Object} extension_obj
 */
var extendProps = function(receiving_obj, extension_obj) {

    for(var prop in extension_obj) {

        receiving_obj[prop] = extension_obj[prop];
    }
};


var has_props = function(obj) {

	if(obj instanceof Array) {

		return !!obj.length;

	} else if(obj instanceof Object) {

		for(var prop in obj) {

			return true;
		}
	}

	return false;
};


/**
 * findUnusedProp
 *
 * Returns a numerical property NOT defined on an Object.
 *
 * TODO:
 *
 * TODO: Ensure is Array OR !!!>>>Object<<<!!!
 *
 * TODO: Add a prop base parameter.
 *
 * @param {Object} data_obj  An Object
 */
var findUnusedProp = function(data_obj) {


    //---------------------------------------------
    // Array
    //---------------------------------------------
    if(data_obj instanceof Array) {


        // <RETURN> => Next Property Number
        return data_obj.length;


    //---------------------------------------------
    // Object
    //---------------------------------------------
    } else {

        // Prop > Collector > Init
        var prop_num = -1;

        // Props > Iterate
        for(var prop in data_obj) {

            // Prop > Test
            if(prop > prop_num) {

                // Prop > Collect
                prop_num = +prop;
            }
        }


        // <RETURN> => (Prop > Number > Next)
        return ++prop_num;
    }
};



//---------------------------------------------
// Repos
//---------------------------------------------


//---------------------------------------------
// Repo
//---------------------------------------------


var Repo = function(query) {};


Repo.prototype = {


	//---------------------------------------------
	// Placeholders
	//---------------------------------------------


	branch_working    : function(){},
	doc_working_cache : function(){},
	doc_head_cache    : function(){},
	query             : function(){},
	repo_working      : function(){},
	repo_global       : function(){},


	//---------------------------------------------
	// References
	//---------------------------------------------


	refresh : function(query) {

		this.query = query = query || this.query;

		this.repo_working    = this.collRepoWorking.find({ n : query }).toArray()[0];

		this.repo_global     = this.collRepo.find(   { _id : this.repo_working.G   }).toArray()[0];

		this.branch_working  = this.collBranch.find( { _id : this.repo_working.W   }).toArray()[0];

		this.doc_working_cache = false;
		//delete this.doc_working_cache;

		this.doc_head_cache    = false;
		//delete this.doc_head_cache;
	},


	branches : function(count) {

		count = count || 10;

		var cursor = this.collBranch.find({ W : this.repo_working._id }, { K:0 }).sort({ _id : -1 });

		while(count-- && cursor.hasNext()) {

			printjson(cursor.next());
		}
	},


	commits : function(count) {

		count = count || 10;

		var cursor = this.collCommitRecord.find({ R : this.branch_working._id }).sort({ _id : -1 });

		while(count-- && cursor.hasNext()) {

			printjson(cursor.next());
		}
	},


	get doc_working() {

		if(this.doc_working_cache) {

			return this.doc_working_cache;

		} else {

			return (this.doc_working_cache = this.collWorking.find({ _id : this.branch_working.w }).toArray()[0]);
		}
	},


	get doc_head() {

		if(this.doc_head_cache) {

			return this.doc_head_cache;

		} else {

			return (this.doc_head_cache = this.collCommit.find({ _s : this.branch_working.s }).toArray()[0]);
		}
	},


	//---------------------------------------------
	// Utility
	//---------------------------------------------


	hash_max_prop : function(hash_prop) {

		var
			doc = this.doc_working,

			max = 0
		;

		for(var prop in doc[hash_prop]) {

			prop = +prop;

			if(prop > max) {

				max = prop;
			}
		}

		return max;
	},


	count_def_missing : function(O, M) {


        //---------------------------------------------
        // Function Variables
        //---------------------------------------------
		var
		    doc = this.doc_working,
			node_meta_hash = doc[M],
			node_def_hash  = doc[O],

            meta_count,
            def_missing,
            meta_clone,
            def_clone
		;

		meta_count = def_missing = meta_clone = def_clone = 0;

		for(var prop in node_meta_hash) {

			++meta_count;

			var def = node_def_hash[prop];

			if(!(def instanceof Object)) {

				++def_missing;

			} else if(def.c) {

				++def_clone;
			}

			var meta = node_meta_hash[prop];

			if(meta && meta.c) {

				++meta_clone;
			}
		}

		print(JSON.stringify({

			meta_count  : meta_count,

			def_missing : def_missing,

			meta_clone  : meta_clone,

			def_clone   : def_clone

		}, null, 4));
	},


	//update_working : function(update) {

		//update(this.branch_working);

		//var doc = this.doc_working();
		
		//db.appWorking.updateOne({ _id : doc._id }, { $set : update_set });
		//db.appWorking.updateOne({ _id : doc._id }, { $set : { i : node_def_hash }});
	//},


	find_duplicates : function(I, O, M) {


        // Variables > Init

        I             = I || "F";
        O             = O || "i";
        M             = M || "m";

		var doc = this.doc_working;

		var
			count         = 0,
			c_F           = 0,
			c_w           = 0,
			c_W           = 0,
			meta_flag     = 0,
			def_flag_old  = 0,
			index_missing = 0
		;

		for(var prop in doc[M]) {

			var def   = doc[O][prop];

			var meta  = doc[M][prop];

			if(meta.c) {

				++meta_flag;
				//print(prop, ": ", JSON.stringify(meta.n));
			}

			if(def.c) {

				print("Def Flag:");
				++def_flag_old;
				print(prop, ": ", JSON.stringify(meta.n));
			}

			switch(def['@']) {

				// Clone
				case 1:

					++c_F;
					if(!(prop in doc.F)) { print(prop, ": ", JSON.stringify(meta.n)); ++index_missing;}

					break;

				// Saved
				case 2:

					++c_w;
					if(!(prop in doc.w)) { print(prop, ": ", JSON.stringify(meta.n)); ++index_missing;}

					break;

				// Widget
				case 3:

					++c_W;
					if(!(prop in doc.W)) { print(prop, ": ", JSON.stringify(meta.n)); ++index_missing;}

					break;
			}
		}

		print(JSON.stringify({

			c_F           : c_F,
			c_w           : c_w,
			c_W           : c_W,
			index_missing : index_missing,
			meta_flag     : meta_flag,
			def_flag_old  : def_flag_old,

		}, null, 4));
	},


	find_ref_node : function(p) {


		// Variables > Init

		var child        = [];
		var res          = {
			child : child,
		};
		var string_ref   = 0;
		var string_temp  = 0;
		var string_class = 0;
		var v            = {

			true  : 0,
			false : 0,
			1     : 0,
			other : 0,
		};
		var doc          = this.doc_working;
		var hash_def     = doc.i;
		var hash_meta    = doc.m;


		// Node > Defs
		for(var prop in hash_def) {

			var def = hash_def[prop];

			var tmp;

			if(def) {

				// Children
				if(
					(tmp = def.i)
				) {
					for(var i=0; i < tmp.length; ++i) {

						if("string" === typeof tmp[i]) {

							++string_ref;
							//tmp[i] = +tmp[i];
						}

						if(tmp[i] == p) {

							child.push(prop);
						}
					}
				}


				// Loop-Node
				if(
					(null != (tmp = def.L)) &&
					(tmp == p)
				) {

					child.push(prop);
				}

				// Show > Flag (def.v)
                //
                // TODO:
                //
                // TODO: REVIEW -> Changed to allow Syntax Validation without
                //                 careful review.
				if(undefined !== def.v) {
				//if(undefined != def.v) {

					if(true === def.v) {

						++v.true;

					} else if(false === def.v) {

						++v.false;

						//def.v = 1;

					} else if(1 === def.v) {

						++v[1];

					} else {

						++v.other;
					}

				}

				// TODO: REMOVED
				// Templates
				//if(
					//(tmp = def.Z)
				//) {
					//for(var i=0; i < tmp.length; ++i) {

						//if("string" === typeof tmp[i]) {

							//++string_temp;
							////tmp[i] = +tmp[i];
						//}
					//}
				//}


				// TODO: REMOVED
				// Classes
				//if(
					//(tmp = def.D)
				//) {
					//for(var i=0; i < tmp.length; ++i) {

						//if("string" === typeof tmp[i]) {

							//++string_class;
							////tmp[i] = +tmp[i];
						//}
					//}
				//}
			}
		}


		// Node > Indexes

		if(p in doc.F) res.F = true;

		if(p in doc.w) res.w = true;

		if(p in doc.W) res.W = true;

		if(string_ref)   res.string_ref  = string_ref;
		if(string_temp)  res.string_temp = string_temp;
		if(string_class) res.string_temp = string_class;
		res.v = v;

		// <RETURN>
		return res;
	},


	//---------------------------------------------
	// Updates
	//---------------------------------------------


	update : function() {

		//this.update_hash_props();
		//return this.update_node();
	},


	update_node : function() {

		var def_missing    = 0;
		var visible_missed = 0;
		var visible_flag   = 0;
		var doc            = this.doc_working;
		var hash_def       = doc.i;
		var hash_meta      = doc.m;
		
		for(var prop in hash_meta) {

			var meta = hash_meta[prop];
			var def  = hash_def[prop];

			// Def > Missing
			if(
				!(def instanceof Object)
			) {

				++def_missing;

				hash_def[prop] = {};


			// Visible
			} else if(
				(false === def.v)
			) {
				++visible_flag;

				def.v = 1;

			} else if(
				(undefined !== def.v) &&
				(1 !== def.v)
			) {

				++visible_missed;
			}
		}

		//this.save_update_node();

		// <RETURN>
		return {

			def_missing    : def_missing,
			visible_missed : visible_missed,
			visible_flag   : visible_flag,
		};
	},


	save_update_node : function() {

		var doc        = this.doc_working;

		this.collWorking.updateOne({ _id : doc._id }, { $set : { i : doc.i } });
	},



	//---------------------------------------------
	// Update
	//   -> Repo
	//       -> Hash Property References
	//---------------------------------------------


	// Move Doc Working & Repo Global
	// Start Rename Hash Property References to new properties
	update_hash_props : function() {

		var doc = this.doc_working;

		this.update_hash_props_inner(doc);

		this.collWorking.updateOne({ _id : doc._id }, { $set : { P : doc.P } });

		doc = this.repo_global;

		this.update_hash_props_inner(doc);

		this.collRepo.updateOne({ _id : doc._id }, { $set : { P : doc.P } });
	},


	// Move Repo Global, Working, etc.
	// Start Rename Hash Property References to new properties
	update_hash_props_inner : function(doc) {

		var hash_props = doc.P;

		var a = [["m", "i"], ["X", "x"], ["C", "c"], ["A", "a"], ["Y", "y"], ["O", "M"]];

		for(var i=0; i < a.length; ++i) {

			hash_props[a[i][1]] = hash_props[a[i][1]] || hash_props[a[i][0]] || 0;

			delete hash_props[a[i][0]];
		}

	},


	//save_update_hash_props : function() {

		//var doc        = this.doc_working;

		//this.collWorking.updateOne({ _id : doc._id }, { $set : { P : doc.P } })
	//},
};


//---------------------------------------------
// App > Repo
//---------------------------------------------


var AppRepo = function(query) {

	this.refresh(query);
};


subclass(AppRepo, Repo, {


	//---------------------------------------------
	// Config
	//---------------------------------------------

	collRepo         : db.appRepo,
	collRepoWorking  : db.appRepoWorking,
	collBranch       : db.appBranch,
	collCommitRecord : db.appCommitRecord,
	collCommit       : db.appCommit,
	collWorking      : db.appWorking,


	//---------------------------------------------
	// Updates
	//---------------------------------------------


	update_now : function() {


		var result     = this.update_move_nxt();

		this.rename_nxt(result.lu_changes);

		result.empty   = this.update_empty_refs_delete();

		//result.before  = result;

		//result.after   = this.update_empty_refs_delete();

        result.request = this.save_update_move_nxt();

		return result;



		//this.rename_nxt(this.update_move_nxt().lu_changes);
	},


	update_move_nxt : function() {


		//---------------------------------------------
		// Variables > Init
		//---------------------------------------------

		var doc_working      = this.doc_working;

		var changes = {

			count    : 0,
			nxt      : 0,
			nxt_meta : 0,
		};

		var lu_changes       = changes.lu_changes = {};

		var hash_nxt         = doc_working.x;
		var hash_nxt_meta    = doc_working.X;

		var hash_node        = doc_working.i;
		var hash_node_meta   = doc_working.m;

		var index_node_clone = doc_working.m;

		var prop_new         = findUnusedProp(hash_node);


		//---------------------------------------------
		// NXT Hash Iterate
		//---------------------------------------------
		for(var prop in hash_nxt) {


			++changes.count;


			//---------------------------------------------
			// Object-Def
			//---------------------------------------------

			var obj_def = hash_nxt[prop];

			if(obj_def instanceof Object) {

				++changes.nxt;

				hash_node[prop_new] = obj_def;

				lu_changes[prop] = prop_new;


				//---------------------------------------------
				// (NXT / Clone) > Index
				//---------------------------------------------

				obj_def['@'] = 4;
				//obj_def['@'] = 1;

				index_node_clone[prop_new] = prop_new;


				//---------------------------------------------
				// Metadata
				//---------------------------------------------

				var obj_def_meta = hash_nxt_meta[prop];

				if(obj_def_meta instanceof Object) {

					++changes.nxt_meta;

					hash_node_meta[prop_new] = obj_def_meta;
				}


				//---------------------------------------------
				// New Prop Increment
				//---------------------------------------------
				++prop_new;
			}
		}


		//---------------------------------------------
		// <RETURN> => Results
		//---------------------------------------------

		changes.prop_new_last = prop_new;

		return changes;
	},


	rename_nxt : function(lu_changes) {


		//---------------------------------------------
		// Variables > Init
		//---------------------------------------------

        var prop;

		var doc_working      = this.doc_working;

		var hash_node        = doc_working.i;


		//---------------------------------------------
        // Node-Def > Hash > X-Temp > Refs > Rename
		//---------------------------------------------
		for(prop in hash_node) {


			//---------------------------------------------
			// Object-Def
			//---------------------------------------------

			var obj_def = hash_node[prop];

			if(obj_def instanceof Object) {


				//---------------------------------------------
				// NXT > Refs
				//---------------------------------------------

				var temps = obj_def.Z;

				if(temps instanceof Array) {

					for(var i=0; i < temps.length; ++i) {

						var temp = temps[i];

						temps[i] = lu_changes[temp] || temp;
					}
				}
			}
		}


		//---------------------------------------------
		// Hash > Index > Build
		//---------------------------------------------

        var hash_index = doc_working.X = {};

		for(prop in lu_changes) {

            var tmp = lu_changes[prop];

            hash_index[tmp] = tmp;
        }
	},


    save_update_move_nxt : function() {

        var doc        = this.doc_working;

        return this.collWorking.updateOne({ _id : doc._id }, {

            $set : {
                i : doc.i,
                m : doc.m,
                X : doc.X,
            },

            $unset : {
                x : '',
                //X : '',
            },
        });
    },


	transform_hash_refs : function(func, hash_prop, hash_meta_prop) {


		//---------------------------------------------
		// Variables > Init
		//---------------------------------------------

		hash_prop      = hash_prop      || 'i';
		hash_meta_prop = hash_meta_prop || 'm';

		var
			//result         = {},
			doc_working    = this.doc_working,
			hash           = doc_working[hash_prop],
			hash_meta      = doc_working[hash_meta_prop]
		;


		//---------------------------------------------
		// Hash > Iterate
		//---------------------------------------------
		for(var prop in hash) {


			//---------------------------------------------
			// Transform > Func > Call
			//---------------------------------------------
			func(hash[prop], prop, hash, hash_meta);
		}
	},


	transform_conv_array : function(

		func,

		conv_array,

		hash_prop,

		hash_meta_prop
	) {


		//---------------------------------------------
		// Transform
		//---------------------------------------------
		this.transform_hash_refs(


			function(obj_def, prop, hash, hash_meta) {


				//---------------------------------------------
				// Iterate > Conversion > Array
				//---------------------------------------------
				for(var i=0; i < conv_array.length; ++i) {


					//--------------------------
					// Transform > Func > Call
					//--------------------------
					func(conv_array[i], obj_def, prop, hash, hash_meta);
				}
			},


			(hash_prop      || 'i'),


			(hash_meta_prop || 'm')
		);
	},


	update_empty_refs_delete : function(

		conv_array,

		hash_prop,

		hash_meta_prop
	) {



		//---------------------------------------------
		// Variables > Init
		//---------------------------------------------
		var
			result = {}
		;



		//---------------------------------------------
		// Transform
		//---------------------------------------------
		this.transform_conv_array(


			function(temp_prop, obj_def, prop, hash, hash_meta) {


				//-----------------------------------
				// Variables > Init
				//-----------------------------------
				var
					temp
				;


				//-----------------------------------
				// Object-Def > Nested > Undefined
				//-----------------------------------
				if(
					!obj_def
				){

					result._missing = result._missing || {};

					result._missing[prop] = prop;


				//-----------------------------------
				// Object-Def > Nested > Exists
				//-----------------------------------
				} else if(
					null != (temp = obj_def[temp_prop])
				){


					if(!has_props(temp)) {


						//--------------------
						// Collect
						//--------------------
						var coll = result[temp_prop] = result[temp_prop] || {
							temp_prop : temp_prop,
							count     : 0,
							missing   : {},
						};

						++coll.count;

						coll.missing[prop] = {

							n     : hash_meta[prop] && hash_meta[prop].n || '',
							empty : temp
						};


						//--------------------
						// Delete
						//--------------------
						delete obj_def[temp_prop];
					}
				}


				//-----------------------------------
				// Bad Prop
				//-----------------------------------
				if((temp = +prop) !== temp) {


					result._bad_prop = result._bad_prop || {};

					result._bad_prop[prop] = prop;


					//--------------------
					// Delete
					//--------------------
					delete hash[prop];
					delete hash_meta[prop];
				}
			},


			conv_array || [

				'Z',
				'i',

				'D',
				's',
				'a',

				'E',
				'e',
				'B',
				'F',
			],


			(hash_prop      || 'i'),


			(hash_meta_prop || 'm')
		);



		//---------------------------------------------
		// <RETURN> => Results
		//---------------------------------------------
		return result;
	},


	//---------------------------------------------
	// TODO: OLD
	//---------------------------------------------


	//empty_refs_count : function(conv_array, hash_prop, hash_meta_prop) {



		////---------------------------------------------
		//// Variables > Init
		////---------------------------------------------
		//var
			//result     = {}
			//conv_array = conv_array || [

				//'Z',
				//'i',

				//'D',
				//'s',
				//'a',

				//'E',
				//'e',
				//'B',
				//'F',
			//];
		//;



		////---------------------------------------------
		//// Transform
		////---------------------------------------------
		//this.transform_hash_refs(


			//function(obj_def, prop, hash, hash_meta) {


				////---------------------------------------------
				//// Iterate > Conversion > Array
				////---------------------------------------------
				//for(var i=0; i < conv_array.length; ++i) {


					////--------------------------------
					//// Variables > Init
					////--------------------------------
					//var
						//temp_prop = conv_array[i],
						//temp
					//;


					////--------------------------------
					//// Object-Def > Nested > Exists
					////--------------------------------
					//if(
						//obj_def &&
						//null != (temp = obj_def[temp_prop])
					//){


						//if(!has_props(temp)) {


							////--------------------
							//// Collect
							////--------------------
							//var coll = result[temp_prop] = result[temp_prop] || {
								//temp_prop : temp_prop,
								//count     : 0,
								//missing   : {},
							//};

							//++coll.count;

							//coll.missing[prop] = {

								//n     : hash_meta[prop] && hash_meta[prop].n || '',
								//empty : temp
							//};


							////--------------------
							//// Delete
							////--------------------
							//delete obj_def[temp_prop];
						//}
					//}
				//}
			//},


			//(hash_prop      || 'i'),


			//(hash_meta_prop || 'm')
		//);



		////---------------------------------------------
		//// <RETURN> => Results
		////---------------------------------------------
		//return result;
	//},


	//empty_refs_count_full : function(conv_array, hash_prop, hash_meta_prop) {


		////---------------------------------------------
		//// Variables > Init
		////---------------------------------------------
		//var
			//result         = {},
			//hash_prop      = hash_prop      || 'i',
			//hash_meta_prop = hash_meta_prop || 'm',
			//doc_working    = this.doc_working;
			//hash           = doc_working[hash_prop],
			//hash_meta      = doc_working[hash_meta_prop],
			//conv_array     = conv_array || [

				//'Z',
				//'i',

				//'D',
				//'s',
				//'a',

				//'E',
				//'e',
				//'B',
				//'F',
			//]
		//;


		////---------------------------------------------
		//// Hash > Iterate
		////---------------------------------------------
		//for(var prop in hash) {


			////---------------------------------------------
			//// Object-Def > Get & Ensure
			////---------------------------------------------
			//var obj_def = hash[prop];

			//if(!obj_def) {

				//continue;
			//}


			////---------------------------------------------
			//// Iterate > Conversion > Array
			////---------------------------------------------
			//for(var i=0; i < conv_array.length; ++i) {


				////---------------------------------------------
				//// Variables > Init
				////---------------------------------------------
				//var
					//temp_prop = conv_array[i]
				//;


				////---------------------------------------------
				//// Object-Def > Nested > Exists
				////---------------------------------------------
				//if(
					////obj_def &&
					//obj_def[temp_prop]
				//){


					//if(!has_props(obj_def[temp_prop])) {


						////--------------------
						//// Collect
						////--------------------
						//var coll = result[temp_prop] = result[temp_prop] || {
							//temp_prop : temp_prop,
							//count     : 0,
							//missing   : {},
						//};

						//++coll.count;

						//coll.missing[prop] = {
							//n     : hash_meta[prop] && hash_meta[prop].n || '',
							//empty : obj_def[temp_prop]
						//};
					//}
				//}
			//}
		//}


		////---------------------------------------------
		//// <RETURN> => Results
		////---------------------------------------------
		//return result;
	//},


	//empty_array_count : function(temp_prop, hash_prop, hash_meta_prop) {


		////---------------------------------------------
		//// Variables > Init
		////---------------------------------------------

		//hash_prop      = hash_prop      || 'i';
		//hash_meta_prop = hash_meta_prop || 'm';
		//temp_prop      = temp_prop      || 'i';

		//var
			//count       = 0,
			//doc_working = this.doc_working;
			//hash        = doc_working[hash_prop],
			//hash_meta   = doc_working[hash_meta_prop],
			//missing     = {}
		//;


		////---------------------------------------------
		//// Hash > Iterate
		////---------------------------------------------
		//for(var prop in hash) {

			//var obj_def = hash[prop];

			//if(
				//obj_def &&
				//obj_def[temp_prop]
			//){

				//if(
					//!has_props(obj_def[temp_prop])
					////!(obj_def[temp_prop] instanceof Array) ||
					////(0 === obj_def[temp_prop].length)
				//) {

					//++count;
					//missing[prop] = {
						//n     : hash_meta[prop] && hash_meta[prop].n || '',
						//empty : obj_def[temp_prop]
					//};
				//}
 			//}
		//}


		////---------------------------------------------
		//// <RETURN> => Results
		////---------------------------------------------
		//return {

			//temp_prop : temp_prop,
			//count     : count,
			//missing   : missing,
		//};
	//},
});


//---------------------------------------------
// Service > Repo
//---------------------------------------------


var ServiceRepo = function(query) {

	this.refresh(query);
};


subclass(ServiceRepo, Repo, {


	collRepo         : db.serviceRepo,
	collRepoWorking  : db.serviceRepoWorking,
	collBranch       : db.serviceBranch,
	collCommitRecord : db.serviceCommitRecord,
	collCommit       : db.serviceCommit,
	collWorking      : db.serviceWorking,
});



//---------------------------------------------
// TODO:
// Branch
//---------------------------------------------


//var Branch = function(query) {

//	this.refresh(query);
//};



//---------------------------------------------
// NOTES:
//---------------------------------------------
//Object.defineProperty(AppRepo.prototype, 'doc_working', {

	//get() {

	//	if(this.doc_working_cache) {

	//		return this.doc_working_cache;

	//	} else {

	//		return (this.doc_working_cache = db.appWorking.find({ _id : this.branch_working.w }).toArray()[0]);
	//	}
		
	//},
//});
