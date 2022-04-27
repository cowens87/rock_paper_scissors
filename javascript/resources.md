# JAVASCRIPT RESOURCES 
Module Cheatsheet 📄‬
Here's a cheatsheet to show you the different ways of exporting and the corresponding way to import it. It really distills to 3 types: name, default, and list. Just make sure your export matches your import way and you will have no problem 👍

// Name Export | Name Import
export const name = 'value'
import { name } from '...'

// Default Export | Default Import
export default 'value'
import anyName from '...'

// Rename Export | NameImport
export { name as newName }
import { newName } from '...'

// Name + Default | Import All
export const name = 'value'
export default 'value'
import * as anyName from '...'

// Export List + Rename | Import List + Rename
export {
  name1,
  name2 as newName2
}
import {
  name1 as newName1,
  newName2
} from '...'
Now let's look at each of them and see how they work 🤓

#a. Name
The key here is having a name. Hence a "named" export lol 😂

export const name = 'value';
import { name } from 'some-path/file';

console.log(name); // 'value'
❌ What did I say, no name, no export!

export 'value'

import { } // 👈 see I don't even know what to put here...give me a name!
#b. Default
With a default export, you don't need any name. Because you can name it whatever you want 👏

export default 'value'
import anyName from 'some-path/file';

console.log(anyName); // 'value'
❌ No Variable Declaration with Default

export default const name = 'value'; // don't try to give me a name!
#Mixing Default + Name
You can absolutely combine default and name export in one file 🤝

export const name = 'value';
export default 'value'
import anyName, { name } from 'some-path/file';
#c. Export List
The third style is an Export List.

const name1 = 'value1';
const name2 = 'value2';

export {
  name1,
  name2
}
import {
  name1,
  name2
} from 'some-path/file'

console.log(
  name1, // 'value1'
  name2, // 'value2'
)
One important thing to note is that these lists are NOT objects. Yes, I know it looks like it. But it isn't. I made this confusion when I first learned modules. It's not an object, it's an export list!

// ❌ Export list ≠ Object
export {
  name: 'name'
}
#Renaming Export
Not happy with the export name. No problem, you can rename it using the as keyword.

const name = 'value'

export {
  name as newName
}
import { newName } from 'some-path/file'

console.log(newName); // 'value'

// Original name is not accessible
console.log(name); // ❌ undefined
❌ Can not combine inline export with export list

export const name = 'value';

// You're already exporting name ☝️, don't export me again
export {
  name
}
#Renaming Import
The same rule applies to import. We can rename it using the as keyword.

const name1 = 'value1';
const name2 = 'value2';

export {
  name1,
  name2 as newName2
}
import {
  name1 as newName1,
  newName2
} from '...'

console.log(newName1); // 'value1'
console.log(newName2); // 'value2'

❌
name1; // undefined
name2; // undefined
#Import All
export const name = 'value';

export default 'defaultValue';
import * as anyName from 'some-path/file';

console.log(anyName.name); // 'value'
console.log(anyName.default); // 'defaultValue'
#Name vs Default
There's been a lot of debate whether one should use default export at all. Check out these 2 articles.

Why I've stopped exporting defaults from my JavaScript modules
GitLab RFC by Thomas Randolph
Like with anything, there is no right or wrong answer. The right way is always what's best for you and your team. But here's how I can think of this debate. Samantha's Story Time ...

#Name vs Default Export in Non-Dev Terms
Let's say you owe your friend some money. Your friend says you can pay them back with cash or e-transfer. Paying through e-transfer is like a named export because your name is attached to the transaction. So if your friend is forgetful and starts chasing you down claiming that you still owe them money. You can simply show them the proof of transfer because your name is on the payment. However, if you had paid your friend back with cash, which is like a default export, you have no proof. They can say the $50 is from Susan and NOT you. The cash has no name attached to it so they could say it's from you or whoever it is 😵

So is it better to go with e-transfer (named export) or cash (default export)? Well that depends, do you trust your friend or not 🤔 Actually, that's not the right way to frame this dilemma. A better solution is to NOT put your relationship in that position. It's better to be explicit so you don't risk jeopardizing your friendship. And yes, this idea also applies to whether you pick named or default export. I prefer to be more explicit, so your code is crystal clear. But of course, your code is your code. And you can do whatever works for you and your team 😄

#Community Input
@kyleshevlin: Maybe there's a way you could add the asterisk import, too, where you import all exports from a module. import * as myModule from '/modules/my-module.js';. The key with that one is that on the import side when using the module, the default is there as myModule.default and the rest are as they are named, myModule.nameOfSomething. CodeSandbox Example

@erikayabar_: 👍 the emphasis on anyName here for default exports! *This is why I prefer named exports, but it seems community is set on default export all the things (especially React components) so it's good to understand the difference! Also seen confused: named imports != destructuring