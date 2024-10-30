### **Oppgave 4: Feilsøking i TypeScript**

**Mål:** Lære å identifisere og rette opp feil i TypeScript-kode.

**Beskrivelse:**  
I denne oppgaven skal du feilsøke en `Profile`-komponent som er skrevet i TypeScript. Koden har en feil som forhindrer den fra å fungere som forventet. Din oppgave er å finne og rette opp feilen. Koden skal vise brukerens navn, alder og arbeidserfaring.

**Link:** [TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)

> [!NOTE]  
> Hvis du ønsker å teste dette loktalt, er det viktig at filen har endingen `.tsx`, og ikke `.jsx`.

   Her er koden for `Profile`-komponenten:

   ```typescript
   import React, { FC } from 'react';

   interface ProfileProps {
     name: string;
     age: number;
     experience: {
       title: string;
       years: number;
     }[];
   }

   const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
     return (
       <div>
         <h1>{name}</h1>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };

   export default Profile;
   ```

<details><summary>Løsning</summary>

Feilen i koden er at `experience`-prop ikke blir sendt inn i riktig format. Her er den korrigerte koden:

```typescript
import React, { FC } from 'react';

interface ProfileProps {
  name: string;
  age: number;
  experience: {
    title: string;
    years: number;
  }[];
}

const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
  return (
    <div>
      <h1>{name}</h1>
      <p>Age: {age}</p>
      <ul>
        {experience.map((exp, index) => (
          <li key={index}>
            {exp.title} - {exp.years} years
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Profile;
```


**Forklaring:**  
Etter å ha rettet opp feilen, vil `Profile`-komponenten nå vise brukerens navn, alder og arbeidserfaring korrekt. Sørg for at dataene som sendes inn som props samsvarer med `ProfileProps`-grensesnittet.

</details>

</br>

**Oppsummering:**

Feilsøking er en viktig ferdighet i utvikling, spesielt når du jobber med TypeScript og React. Ved å identifisere og rette opp feil i koden, kan du sikre at komponentene dine fungerer som forventet og gir en god brukeropplevelse. TypeScript hjelper med å fange opp mange feil tidlig i utviklingsprosessen, noe som kan spare tid og redusere frustrasjon.

[TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)  
[React and TypeScript: Props](https://fettblog.eu/typescript-react/props/)
