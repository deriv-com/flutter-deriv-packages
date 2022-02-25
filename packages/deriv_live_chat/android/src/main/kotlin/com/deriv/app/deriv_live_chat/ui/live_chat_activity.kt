import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.deriv.app.deriv_live_chat.R
import com.livechatinc.inappchat.ChatWindowConfiguration
import com.livechatinc.inappchat.ChatWindowErrorType
import com.livechatinc.inappchat.ChatWindowView
import com.livechatinc.inappchat.models.NewMessageModel

class ChatActivity : AppCompatActivity(), ChatWindowView.ChatWindowEventsListener {
    lateinit var chatWindowView :ChatWindowView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_live_chat)
//        chatWindowView = ChatWindowView.createAndAttachChatWindowInstance(this)
        chatWindowView = findViewById(R.id.embeddedChatWindow)
        startChatView()
    }

    override fun onBackPressed()  {
        chatWindowView.onBackPressed()
        super.onBackPressed()
    }

    fun startChatView() {
        val configuration =  ChatWindowConfiguration.Builder()
            .setLicenceNumber(intent.getStringExtra(keyLicenceNumber))
            .setGroupId(intent.getStringExtra(keyGroupId))
            .setVisitorName(intent.getStringExtra(keyVisitorName))
            .setVisitorEmail(intent.getStringExtra(keyVisitorEmail))
            .build()


        chatWindowView.setUpWindow(configuration)
        chatWindowView.setUpListener(this)
        chatWindowView.initialize()
        chatWindowView.showChatWindow()

    }


    companion object {
        private const val keyLicenceNumber = "key_order_notes"
        private const val keyGroupId = "key_cart_id"
        private const val keyVisitorName = "key_is_recurring"
        private const val keyVisitorEmail = "key_is_recurring"

        fun start(context: Activity, licenceNumber:String, groupId:String, visitorName : String, visitorEmail:String) {
            val intent = Intent(context, ChatActivity::class.java)
            intent.putExtra(keyLicenceNumber,licenceNumber)
            intent.putExtra(keyGroupId,groupId)
            intent.putExtra(keyVisitorName,visitorName)
            intent.putExtra(keyVisitorEmail,visitorEmail)

            (context as Activity).startActivity(intent)
        }
    }

    override fun onChatWindowVisibilityChanged(visible: Boolean) {

    }

    override fun onNewMessage(message: NewMessageModel?, windowVisible: Boolean) {
        Toast.makeText(this,message?.text, Toast.LENGTH_LONG).show()
    }

    override fun onStartFilePickerActivity(intent: Intent?, requestCode: Int) {

    }
    override fun onError(
        errorType: ChatWindowErrorType?,
        errorCode: Int,
        errorDescription: String?
    ): Boolean {
        return true
    }

    override fun handleUri(uri: Uri?): Boolean {
        return true
    }
}