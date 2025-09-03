export function addition(a: number, b: number): number {
  return a + b;
}

if (require.main === module) {
  console.log("Hello depuis TypeScript 👋");
  console.log("2 + 3 =", addition(2, 3));
}
