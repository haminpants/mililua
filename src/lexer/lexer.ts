export type TokenType =
    | "IDENTIFIER"

export interface Token {
    type: TokenType
    value: string
    index: number
    length: number
}

export class Lexer {
    private idx: number = 0
    private source: string

    constructor(_source: string) {
        this.source = _source
    }

    private peek(): string {
        return this.source[this.idx]
    }

    private next(): string {
        return this.source[this.idx++]
    }

    isAtEnd(): boolean {
        return this.idx >= this.source.length
    }

    tokenize(): Token[] {
        const tokens: Token[] = []

        while (!this.isAtEnd()) {
            const char = this.peek()
            if (/\s/.test(char)) {
                this.idx++
                continue
            }

            if (/[a-zA-Z_]/.test(char)) {
                let identifier = ""
                const _index = this.idx
                while (!this.isAtEnd() && /[a-zA-Z0-9_]/.test(this.peek())) {
                    identifier += this.next()
                }
                tokens.push({
                    type: "IDENTIFIER",
                    value: identifier,
                    index: _index,
                    length: this.idx - _index
                })
            }
        }

        return tokens
    }
}

const l = new Lexer('Hello World')
console.log(l.tokenize())