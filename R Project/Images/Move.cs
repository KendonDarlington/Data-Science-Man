using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; //So you can use SceneManager

public class Move : MonoBehaviour
{
    public float speed = 5;
    public float jump = 1;
    public GameObject rayOrigin;
    public float rayCheckDistance = 5;
    Rigidbody2D rb;

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    void FixedUpdate()
    {
        float x = Input.GetAxis("Horizontal");
        
        if (Input.GetAxis("Jump") > 0)
        {
            RaycastHit2D hit = Physics2D.Raycast(rayOrigin.transform.position, Vector2.down, rayCheckDistance);
            if (hit.collider != null)
            {                
                rb.AddForce(Vector2.up * jump, ForceMode2D.Impulse);
            }
        }
        rb.velocity = new Vector3(x * speed, rb.velocity.y, 0);        

        

        
    }
    void Update()
    {
        if (Input.GetKeyDown("r"))
        { //If you press R
            SceneManager.LoadScene("SampleScene"); //Load scene called Game
        }
    }
}
