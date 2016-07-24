

#import "CCSpriteBatchNode.h"
#import "Support/uthash.h"

enum {
	kCCLabelAutomaticWidth = -1,
};

/** @struct ccBMFontDef
 BMFont definition
 */
typedef struct _BMFontDef {
	//! ID of the character
	unichar charID;
	//! origin and size of the font
	CGRect rect;
	//! The X amount the image should be offset when drawing the image (in pixels)
	short xOffset;
	//! The Y amount the image should be offset when drawing the image (in pixels)
	short yOffset;
	//! The amount to move the current position after drawing the character (in pixels)
	short xAdvance;
} ccBMFontDef;

/** @struct ccBMFontPadding
 BMFont padding
 @since v0.8.2
 */
typedef struct _BMFontPadding {
	/// padding left
	int	left;
	/// padding top
	int top;
	/// padding right
	int right;
	/// padding bottom
	int bottom;
} ccBMFontPadding;

#pragma mark - Hash Element
typedef struct _FontDefHashElement
{
	NSUInteger		key;		// key. Font Unicode value
	ccBMFontDef		fontDef;	// font definition
	UT_hash_handle	hh;
} tCCFontDefHashElement;

// Equal function for targetSet.
typedef struct _KerningHashElement
{
	int				key;		// key for the hash. 16-bit for 1st element, 16-bit for 2nd element
	int				amount;
	UT_hash_handle	hh;
} tCCKerningHashElement;
#pragma mark -

/** CCBMFontConfiguration has parsed configuration of the the .fnt file
 @since v0.8
 */
@interface CCBMFontConfiguration : NSObject
{
	// Character Set defines the letters that actually exist in the font
	NSCharacterSet *_characterSet;
  
	// atlas name
	NSString		*_atlasName;
    
    // XXX: Creating a public interface so that the bitmapFontArray[] is accessible
@public
    
	// BMFont definitions
	tCCFontDefHashElement	*_fontDefDictionary;
    
	// FNTConfig: Common Height. Should be signed (issue #1343)
	NSInteger		_commonHeight;
    
	// Padding
	ccBMFontPadding	_padding;
    
	// values for kerning
	tCCKerningHashElement	*_kerningDictionary;
}

// Character set
@property (nonatomic, retain, readonly) NSCharacterSet *characterSet;

// atlasName
@property (nonatomic, readwrite, retain) NSString *atlasName;

/** allocates a CCBMFontConfiguration with a FNT file */
+(id) configurationWithFNTFile:(NSString*)FNTfile;
/** initializes a CCBMFontConfiguration with a FNT file */
-(id) initWithFNTfile:(NSString*)FNTfile;
@end


/** CCLabelBMFont is a subclass of CCSpriteBatchNode
 
 Features:
 - Treats each character like a CCSprite. This means that each individual character can be:
 - rotated
 - scaled
 - translated
 - tinted
 - chage the opacity
 - It can be used as part of a menu item.
 - anchorPoint can be used to align the "label"
 - Supports AngelCode text format
 
 Limitations:
 - All inner characters are using an anchorPoint of (0.5f, 0.5f) and it is not recommend to change it
 because it might affect the rendering
 
 CCLabelBMFont implements the protocol CCLabelProtocol, like CCLabel and CCLabelAtlas.
 CCLabelBMFont has the flexibility of CCLabel, the speed of CCLabelAtlas and all the features of CCSprite.
 If in doubt, use CCLabelBMFont instead of CCLabelAtlas / CCLabel.
 
 Supported editors:
 - http://glyphdesigner.71squared.com/
 - http://www.bmglyph.com/
 - http://www.n4te.com/hiero/hiero.jnlp
 - http://slick.cokeandcode.com/demos/hiero.jnlp
 - http://www.angelcode.com/products/bmfont/
 
 @since v0.8
 */

@interface CCLabelBMFont : CCSpriteBatchNode <CCLabelProtocol, CCRGBAProtocol>
{
	// string to render
	NSString		*_string;
    
    // name of fntFile
    NSString        *_fntFile;
    
    // initial string without line breaks
    NSString *_initialString;
    // max width until a line break is added
    float _width;
    // alignment of all lines
    CCTextAlignment _alignment;
    
	CCBMFontConfiguration	*_configuration;
    
	// texture RGBA
	GLubyte		_displayedOpacity, _realOpacity;
	ccColor3B	_displayedColor, _realColor;
	BOOL		_cascadeOpacityEnabled, _cascadeColorEnabled;
	BOOL		_opacityModifyRGB;
	
	// offset of the texture atlas
	CGPoint			_imageOffset;
	
	// reused char
	CCSprite		*_reusedChar;
}

/** Purges the cached data.
 Removes from memory the cached configurations and the atlas name dictionary.
 @since v0.99.3
 */
+(void) purgeCachedData;

/** alignment used for the label */
@property (nonatomic,assign,readonly) CCTextAlignment alignment;
/** fntFile used for the font */
@property (nonatomic,retain) NSString* fntFile;
/** conforms to CCRGBAProtocol protocol */
@property (nonatomic,readwrite) GLubyte opacity;
/** conforms to CCRGBAProtocol protocol */
@property (nonatomic,readwrite) ccColor3B color;


/** creates a BMFont label with an initial string and the FNT file. */
+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile;
/** creates a BMFont label with an initial string, the FNT file, width, and alignment option */
+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment;
/** creates a BMFont label with an initial string, the FNT file, width, alignment option and the offset of where the glyphs start on the .PNG image */
+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset;

/** init a BMFont label with an initial string and the FNT file */
-(id) initWithString:(NSString*)string fntFile:(NSString*)fntFile;
/** init a BMFont label with an initial string and the FNT file, width, and alignment option*/
-(id) initWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment;
/** init a BMFont label with an initial string and the FNT file, width, alignment option and the offset of where the glyphs start on the .PNG image */
-(id) initWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset;

/** updates the font chars based on the string to render */
-(void) createFontChars;

/** set label width */
- (void)setWidth:(float)width;

/** set label alignment */
- (void)setAlignment:(CCTextAlignment)alignment;

@end

/** Free function that parses a FNT file a place it on the cache
 */
CCBMFontConfiguration * FNTConfigLoadFile( NSString *file );
/** Purges the FNT config cache
 */
void FNTConfigRemoveCache( void );


