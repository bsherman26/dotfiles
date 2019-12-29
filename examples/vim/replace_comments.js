
// Attempt to Replace Fancy JS Comments with Dashes
'<,'>s/^\(\s\+\)\(\/\*\+\|\s\*\+\/\)\|\s\*/\1\/\/\=repeat('-', len(submatch(2)))/

// NOTES:

// NOTE: It looks like the repeat function needs to be either the first or the
//       only line of the subsitution
// NOTE: Consider using the :g (Global Function)




    /*****************
     * Test Comment 1
     *****************/

        /**********************
         * Test Comment Second
         *
         * TODO: Stuff
         **********************/
